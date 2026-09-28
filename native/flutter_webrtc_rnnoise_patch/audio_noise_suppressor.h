#ifndef FLUTTER_WEBRTC_AUDIO_NOISE_SUPPRESSOR_HXX
#define FLUTTER_WEBRTC_AUDIO_NOISE_SUPPRESSOR_HXX

// Real-time neural noise suppression (RNNoise, github.com/xiph/rnnoise,
// vendored at native/rnnoise -- see UPSTREAM.md there) applied to the
// local capture signal, via the same libwebrtc CustomProcessing hook
// audio_eq_processor.h already uses. See audio_capture_chain.h for how
// this composes with the EQ processor into the single object
// SetCapturePostProcessing actually gets (that API only accepts one).
//
// RNNoise hard-assumes 48kHz mono, exactly 480 samples (10ms) per call
// -- both fixed, non-negotiable constants of the upstream library, not
// tunable. libwebrtc's Process() callback doesn't promise to hand us
// exactly 480 frames at a time, so this accumulates captured samples
// into a ring buffer per channel and fires RNNoise once a full window
// is available, draining processed output back out at whatever
// granularity Process() actually asked for -- the same
// accumulate-then-fire shape OBS Studio's own production RNNoise filter
// uses (plugins/obs-filters/noise-suppress-filter.c), adapted to a
// synchronous in/out buffer instead of a timestamped audio callback.
//
// Unlike AudioEqProcessor (whose biquads degrade gracefully across
// libwebrtc's internal frequency sub-bands, since a shelf/peak filter
// on a sub-band slice is still meaningful, just not full-band), RNNoise
// runs a real FFT/pitch analysis that would likely be actively wrong on
// a sub-band slice, not merely suboptimal -- so this only ever engages
// when num_bands == 1. That assumption is logged and verified once at
// runtime the first time Process() is called (see the .cc) rather than
// silently trusted -- if it's ever wrong on some future libwebrtc
// build, the safe fallback is "never engages" (buffer left untouched),
// matching AudioEqProcessor's own fail-safe philosophy.

#include <array>
#include <atomic>
#include <deque>
#include <vector>

#include "rnnoise.h"
#include "rtc_audio_processing.h"

namespace flutter_webrtc_plugin {

class AudioNoiseSuppressor
    : public libwebrtc::RTCAudioProcessing::CustomProcessing {
 public:
  AudioNoiseSuppressor();
  ~AudioNoiseSuppressor() override;

  // Safe to call from any thread; takes effect from the next Process()
  // call. Disabling skips the *entire* Process() body, ring-buffer
  // bookkeeping included -- a user who never enables this pays zero
  // extra CPU, same property AudioEqProcessor's all-flat fast path has.
  void SetEnabled(bool enabled);

  // libwebrtc::RTCAudioProcessing::CustomProcessing:
  void Initialize(int sample_rate_hz, int num_channels) override;
  void Process(int num_bands, int num_frames, int buffer_size,
               float* buffer) override;
  void Reset(int new_rate) override;
  void Release() override;

 private:
  // RNNoise's own fixed frame size at its hard-assumed 48kHz -- both are
  // upstream constants, not something Koda's code chooses.
  static constexpr int kFrameSize = 480;
  static constexpr int kRequiredSampleRateHz = 48000;

  struct ChannelState {
    DenoiseState* rnnoise_state = nullptr;
    std::array<float, kFrameSize> input_ring{};
    int input_fill = 0;
    std::deque<float> output_queue;
  };

  void ProcessChannel(ChannelState& state, float* data, int num_frames);
  void ReleaseChannels();

  std::atomic<bool> enabled_{false};
  int sample_rate_hz_ = kRequiredSampleRateHz;
  int num_channels_ = 1;
  bool logged_assumptions_ = false;
  RNNModel* model_ = nullptr;
  std::vector<ChannelState> channels_;
};

}  // namespace flutter_webrtc_plugin

#endif  // FLUTTER_WEBRTC_AUDIO_NOISE_SUPPRESSOR_HXX
