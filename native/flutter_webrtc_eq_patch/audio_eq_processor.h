#ifndef FLUTTER_WEBRTC_AUDIO_EQ_PROCESSOR_HXX
#define FLUTTER_WEBRTC_AUDIO_EQ_PROCESSOR_HXX

// Real mic EQ: a 3-band (bass/mid/treble) filter applied to the local
// capture signal *before* it's encoded and published, via libwebrtc's
// RTCAudioProcessing::CustomProcessing hook (see rtc_audio_processing.h).
// That hook is real but was never wired to anything in flutter_webrtc --
// see flutter_webrtc_base.cc's constructor and flutter_webrtc.cc's
// "setMicEqGains" method for the wiring, both gated to Windows only for
// now (see Koda's plan doc for why).
//
// This file lives under windows/ because that's the only platform it's
// wired up on today, but the DSP math itself is plain, platform-agnostic
// C++ (operates on a float* buffer + sample rate/channel count, no
// Windows types) so a future macOS/Android port can reuse it as-is and
// only needs new native glue.
//
// Buffer layout caveat: CustomProcessing::Process's exact buffer layout
// isn't documented in the header this is built against (the underlying
// libwebrtc.dll is prebuilt/closed), only Process(num_bands, num_frames,
// buffer_size, buffer) is. This implements the best-supported reading --
// channel-major, then libwebrtc's own internal frequency-sub-band split
// (unrelated to bass/mid/treble below), then frame, i.e.
// buffer_size == num_channels * num_bands * num_frames -- and verifies
// that arithmetic on every call, silently skipping processing (never
// touching the buffer) if it doesn't hold. Wrong is safe here: worst
// case the EQ has no effect, not corrupted audio.
//
// Standard RBJ Audio-EQ-Cookbook biquad formulas for the shelf/peak
// filters -- see e.g. https://www.w3.org/andrewnesbitt/1997/audio-eq-cookbook.html
// or countless other transcriptions of the same well-known formulas.

#include <array>
#include <cstddef>
#include <mutex>
#include <vector>

#include "rtc_audio_processing.h"

namespace flutter_webrtc_plugin {

// One RBJ biquad's coefficients + its own delay-line state. Never shared
// across channels or libwebrtc's internal sub-bands -- each needs
// independent history or they'd bleed into each other.
class BiquadFilter {
 public:
  void SetLowShelf(double sample_rate_hz, double corner_hz, double gain_db);
  void SetPeaking(double sample_rate_hz, double center_hz, double gain_db,
                   double q);
  void SetHighShelf(double sample_rate_hz, double corner_hz, double gain_db);

  // In-place: applied sample by sample, so the same buffer is both
  // input and output as filtering proceeds.
  void ProcessInPlace(float* samples, int num_frames);

  void Reset();

 private:
  void SetCoefficients(double b0, double b1, double b2, double a0, double a1,
                        double a2);

  // Normalized (divided through by a0) transfer function coefficients.
  // Identity/pass-through until Set*() is called.
  double b0_ = 1.0, b1_ = 0.0, b2_ = 0.0;
  double a1_ = 0.0, a2_ = 0.0;

  // x[n-1], x[n-2], y[n-1], y[n-2].
  double x1_ = 0.0, x2_ = 0.0, y1_ = 0.0, y2_ = 0.0;
};

// One channel's worth of the 3-band cascade (bass -> mid -> treble),
// independently per libwebrtc sub-band (see the buffer-layout caveat
// above) since a sub-band split, if it's ever actually in effect, is a
// different frequency range each time and needs its own filter history.
struct ThreeBandCascade {
  BiquadFilter bass;
  BiquadFilter mid;
  BiquadFilter treble;

  void ProcessInPlace(float* samples, int num_frames) {
    bass.ProcessInPlace(samples, num_frames);
    mid.ProcessInPlace(samples, num_frames);
    treble.ProcessInPlace(samples, num_frames);
  }
};

class AudioEqProcessor : public libwebrtc::RTCAudioProcessing::CustomProcessing {
 public:
  AudioEqProcessor();
  ~AudioEqProcessor() override;

  // Gains in dB, roughly -12..+12 -- 0/0/0 is a no-op pass-through
  // (skipped entirely, not just flat coefficients, so a user who never
  // touches EQ pays zero extra CPU cost). Safe to call from any thread;
  // takes effect from the next Process() call, not mid-buffer.
  void SetGainsDb(double bass_db, double mid_db, double treble_db);

  // Broadband preamp gain, dB, roughly 0..+20 -- applied to the whole
  // signal *before* the 3-band EQ above (mirrors a real mixer's trim
  // knob coming before its tone controls), with a hard clamp to
  // [-1, 1] afterward so a boosted signal can't wrap/alias on its way
  // back into a float sample -- clipping is audible distortion, wrapping
  // is far worse. 0.0 is a no-op, skipped entirely like the EQ bands.
  void SetBoostDb(double boost_db);

  // libwebrtc::RTCAudioProcessing::CustomProcessing:
  void Initialize(int sample_rate_hz, int num_channels) override;
  void Process(int num_bands, int num_frames, int buffer_size,
               float* buffer) override;
  void Reset(int new_rate) override;
  void Release() override;

 private:
  void RebuildFiltersLocked();

  std::mutex mutex_;
  int sample_rate_hz_ = 48000;
  int num_channels_ = 1;
  double bass_db_ = 0.0;
  double mid_db_ = 0.0;
  double treble_db_ = 0.0;
  double boost_db_ = 0.0;
  double boost_linear_ = 1.0;  // 10^(boost_db_/20), recomputed on change only.
  bool gains_changed_ = false;

  // Indexed [channel][libwebrtc sub-band] -- sized in Initialize(), and
  // conservatively re-sized (never shrunk mid-callback) if a later
  // Process() call ever reports more bands than Initialize() implied.
  std::vector<std::vector<ThreeBandCascade>> filters_;
};

}  // namespace flutter_webrtc_plugin

#endif  // FLUTTER_WEBRTC_AUDIO_EQ_PROCESSOR_HXX
