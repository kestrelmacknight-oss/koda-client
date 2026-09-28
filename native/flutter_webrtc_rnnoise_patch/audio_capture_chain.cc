#include "audio_capture_chain.h"

namespace flutter_webrtc_plugin {

AudioCaptureChain::AudioCaptureChain() = default;
AudioCaptureChain::~AudioCaptureChain() = default;

void AudioCaptureChain::Initialize(int sample_rate_hz, int num_channels) {
  noise_suppressor_.Initialize(sample_rate_hz, num_channels);
  eq_processor_.Initialize(sample_rate_hz, num_channels);
}

void AudioCaptureChain::Process(int num_bands, int num_frames,
                                 int buffer_size, float* buffer) {
  // Denoise first, then tone-shape, on the same buffer in place.
  noise_suppressor_.Process(num_bands, num_frames, buffer_size, buffer);
  eq_processor_.Process(num_bands, num_frames, buffer_size, buffer);
}

void AudioCaptureChain::Reset(int new_rate) {
  noise_suppressor_.Reset(new_rate);
  eq_processor_.Reset(new_rate);
}

void AudioCaptureChain::Release() {
  noise_suppressor_.Release();
  eq_processor_.Release();
}

}  // namespace flutter_webrtc_plugin
