#ifndef FLUTTER_WEBRTC_AUDIO_CAPTURE_CHAIN_HXX
#define FLUTTER_WEBRTC_AUDIO_CAPTURE_CHAIN_HXX

// libwebrtc's RTCAudioProcessing::SetCapturePostProcessing (see
// rtc_audio_processing.h) accepts exactly one CustomProcessing* -- a
// second call replaces, it doesn't compose. Koda has two independent
// capture-side processors (RNNoise denoising, see
// audio_noise_suppressor.h; the 3-band mic EQ, see audio_eq_processor.h
// -- unmodified by this file), so this is the single object that
// actually gets registered, forwarding each CustomProcessing method to
// both in a fixed order: denoise first, then tone-shape -- mirrors a
// real mixer's noise-gate-before-EQ signal chain, and matches processing
// noise out of the signal before deciding how to color what's left.
//
// Deliberately a thin forwarder with no buffer-layout logic of its own
// -- each sub-processor already validates its own assumptions and fails
// safe (no-ops) independently, so there's nothing extra to check here.

#include "audio_eq_processor.h"
#include "audio_noise_suppressor.h"
#include "rtc_audio_processing.h"

namespace flutter_webrtc_plugin {

class AudioCaptureChain
    : public libwebrtc::RTCAudioProcessing::CustomProcessing {
 public:
  AudioCaptureChain();
  ~AudioCaptureChain() override;

  AudioNoiseSuppressor& noise_suppressor() { return noise_suppressor_; }
  AudioEqProcessor& eq_processor() { return eq_processor_; }

  // libwebrtc::RTCAudioProcessing::CustomProcessing:
  void Initialize(int sample_rate_hz, int num_channels) override;
  void Process(int num_bands, int num_frames, int buffer_size,
               float* buffer) override;
  void Reset(int new_rate) override;
  void Release() override;

 private:
  AudioNoiseSuppressor noise_suppressor_;
  AudioEqProcessor eq_processor_;
};

}  // namespace flutter_webrtc_plugin

#endif  // FLUTTER_WEBRTC_AUDIO_CAPTURE_CHAIN_HXX
