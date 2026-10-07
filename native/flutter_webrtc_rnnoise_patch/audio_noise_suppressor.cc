#include "audio_noise_suppressor.h"

#include <windows.h>

#include <algorithm>
#include <cstdio>
#include <cstring>

namespace flutter_webrtc_plugin {

namespace {

// The weights blob is embedded as a Windows RCDATA resource (see
// rnnoise_hooks.patch's addition to windows/CMakeLists.txt and the new
// windows/audio_noise_suppressor.rc) rather than compiled in as C source
// -- see native/rnnoise/UPSTREAM.md for why. Loaded once, lazily, and
// kept for the life of the process; RNNModel just wraps the resource
// pointer (rnnoise_model_from_buffer does not copy the data), and a
// module's resources stay valid for as long as the module is loaded, so
// there's nothing to free here beyond the small RNNModel struct itself.
RNNModel* LoadEmbeddedModel() {
  HMODULE module = nullptr;
  if (!GetModuleHandleExA(
          GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
              GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
          reinterpret_cast<LPCSTR>(&LoadEmbeddedModel), &module) ||
      module == nullptr) {
    return nullptr;
  }

  // RT_RCDATA is MAKEINTRESOURCE(10), a TCHAR-aware macro -- under a
  // UNICODE build it resolves to the MAKEINTRESOURCEW (LPWSTR) variant,
  // which doesn't implicitly convert to FindResourceA's LPCSTR parameter.
  // The reinterpret_cast is safe: RT_RCDATA is never a real string, just
  // the integer 10 disguised as a pointer, so reinterpreting it between
  // the A/W pointer types changes nothing about its actual value.
  HRSRC res = FindResourceA(module, "RNNOISE_WEIGHTS", reinterpret_cast<LPCSTR>(RT_RCDATA));
  if (res == nullptr) return nullptr;
  HGLOBAL res_handle = LoadResource(module, res);
  if (res_handle == nullptr) return nullptr;
  const void* data = LockResource(res_handle);
  const DWORD size = SizeofResource(module, res);
  if (data == nullptr || size == 0) return nullptr;

  return rnnoise_model_from_buffer(data, static_cast<int>(size));
}

}  // namespace

AudioNoiseSuppressor::AudioNoiseSuppressor() = default;

AudioNoiseSuppressor::~AudioNoiseSuppressor() { ReleaseChannels(); }

void AudioNoiseSuppressor::SetEnabled(bool enabled) {
  enabled_.store(enabled, std::memory_order_relaxed);
}

void AudioNoiseSuppressor::ReleaseChannels() {
  for (auto& ch : channels_) {
    if (ch.rnnoise_state != nullptr) {
      rnnoise_destroy(ch.rnnoise_state);
      ch.rnnoise_state = nullptr;
    }
  }
  channels_.clear();
}

void AudioNoiseSuppressor::Initialize(int sample_rate_hz, int num_channels) {
  sample_rate_hz_ = sample_rate_hz > 0 ? sample_rate_hz : kRequiredSampleRateHz;
  num_channels_ = num_channels > 0 ? num_channels : 1;
  logged_assumptions_ = false;

  ReleaseChannels();

  if (model_ == nullptr) {
    model_ = LoadEmbeddedModel();
    if (model_ == nullptr) {
      // No model, no suppression -- Process() below no-ops with an
      // empty channels_ list rather than crash. This should only ever
      // happen if the resource failed to embed at build time.
      OutputDebugStringA(
          "[Koda RNNoise] Failed to load embedded weights_blob.bin "
          "resource -- deep noise suppression will be a no-op.\n");
      return;
    }
  }

  channels_.resize(static_cast<size_t>(num_channels_));
  for (auto& ch : channels_) {
    ch.rnnoise_state = rnnoise_create(model_);
    ch.input_fill = 0;
    ch.output_queue.clear();
  }
}

void AudioNoiseSuppressor::Process(int num_bands, int num_frames,
                                    int buffer_size, float* buffer) {
  if (!enabled_.load(std::memory_order_relaxed)) return;
  if (buffer == nullptr || num_frames <= 0 || num_channels_ <= 0) return;
  if (channels_.empty()) return;  // model failed to load in Initialize()

  if (!logged_assumptions_) {
    // Required verification, not just a debugging nicety: RNNoise hard-
    // assumes 48kHz, and only num_bands == 1 is treated as "plain,
    // full-band audio" by this adapter (see the header's doc comment on
    // why sub-band slices are skipped rather than guessed at). Log once
    // so this can be confirmed against a real build/device before
    // trusting the gate below in production.
    char msg[160];
    std::snprintf(msg, sizeof(msg),
                   "[Koda RNNoise] Process() observed sample_rate_hz=%d "
                   "num_bands=%d num_frames=%d buffer_size=%d "
                   "num_channels=%d\n",
                   sample_rate_hz_, num_bands, num_frames, buffer_size,
                   num_channels_);
    OutputDebugStringA(msg);
    logged_assumptions_ = true;
  }

  if (num_bands != 1) return;
  if (sample_rate_hz_ != kRequiredSampleRateHz) return;

  const long long per_channel = static_cast<long long>(num_frames);
  if (per_channel <= 0 ||
      per_channel * num_channels_ != static_cast<long long>(buffer_size)) {
    return;  // Doesn't match this adapter's layout assumption -- fail safe.
  }

  const int usable_channels =
      (std::min)(num_channels_, static_cast<int>(channels_.size()));
  for (int ch = 0; ch < usable_channels; ++ch) {
    float* channel_buffer = buffer + static_cast<long long>(ch) * per_channel;
    ProcessChannel(channels_[static_cast<size_t>(ch)], channel_buffer,
                    num_frames);
  }
}

void AudioNoiseSuppressor::ProcessChannel(ChannelState& state, float* data,
                                           int num_frames) {
  if (state.rnnoise_state == nullptr) return;

  // 1. Feed raw input into the 480-sample window, firing RNNoise (in
  //    place -- same buffer for in/out is safe, matches how RNNoise's
  //    own examples and OBS's production filter both call it) on every
  //    complete window, queuing the denoised result for step 2.
  int offset = 0;
  while (offset < num_frames) {
    const int take =
        (std::min)(kFrameSize - state.input_fill, num_frames - offset);
    std::memcpy(state.input_ring.data() + state.input_fill, data + offset,
                static_cast<size_t>(take) * sizeof(float));
    state.input_fill += take;
    offset += take;
    if (state.input_fill == kFrameSize) {
      rnnoise_process_frame(state.rnnoise_state, state.input_ring.data(),
                             state.input_ring.data());
      for (float s : state.input_ring) state.output_queue.push_back(s);
      state.input_fill = 0;
    }
  }

  // 2. Emit num_frames samples back into `data`: processed audio where
  //    available; any still-buffering startup shortfall just leaves the
  //    original raw sample already sitting in `data` untouched, rather
  //    than emitting silence -- a one-time, sub-20ms pass-through blip
  //    while the very first window fills, never a drop or a gap.
  for (int i = 0; i < num_frames; ++i) {
    if (state.output_queue.empty()) break;
    data[i] = state.output_queue.front();
    state.output_queue.pop_front();
  }
}

void AudioNoiseSuppressor::Reset(int new_rate) {
  sample_rate_hz_ = new_rate > 0 ? new_rate : sample_rate_hz_;
  logged_assumptions_ = false;
  for (auto& ch : channels_) {
    ch.input_fill = 0;
    ch.output_queue.clear();
  }
}

void AudioNoiseSuppressor::Release() {
  ReleaseChannels();
  if (model_ != nullptr) {
    rnnoise_model_free(model_);
    model_ = nullptr;
  }
}

}  // namespace flutter_webrtc_plugin
