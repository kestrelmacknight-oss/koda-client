#include "audio_eq_processor.h"

#include <algorithm>
#include <cmath>

namespace flutter_webrtc_plugin {

namespace {
constexpr double kPi = 3.14159265358979323846;

// A = 10^(gainDb/40) -- the RBJ cookbook's amplitude term for shelf/peak
// filters (note /40, not /20 -- these formulas define gain in terms of
// this A already being sqrt(linear gain)).
double DbToA(double gain_db) { return std::pow(10.0, gain_db / 40.0); }
}  // namespace

void BiquadFilter::SetCoefficients(double b0, double b1, double b2,
                                    double a0, double a1, double a2) {
  // Normalize by a0 up front so ProcessInPlace never divides per-sample.
  b0_ = b0 / a0;
  b1_ = b1 / a0;
  b2_ = b2 / a0;
  a1_ = a1 / a0;
  a2_ = a2 / a0;
}

void BiquadFilter::SetLowShelf(double sample_rate_hz, double corner_hz,
                                double gain_db) {
  const double A = DbToA(gain_db);
  const double w0 = 2.0 * kPi * corner_hz / sample_rate_hz;
  const double cos_w0 = std::cos(w0);
  const double sin_w0 = std::sin(w0);
  const double Q = 0.707;  // shelf slope S=1, the cookbook's usual default.
  const double alpha = sin_w0 / (2.0 * Q);
  const double sqrtA = std::sqrt(A);
  const double two_sqrtA_alpha = 2.0 * sqrtA * alpha;

  const double b0 = A * ((A + 1) - (A - 1) * cos_w0 + two_sqrtA_alpha);
  const double b1 = 2.0 * A * ((A - 1) - (A + 1) * cos_w0);
  const double b2 = A * ((A + 1) - (A - 1) * cos_w0 - two_sqrtA_alpha);
  const double a0 = (A + 1) + (A - 1) * cos_w0 + two_sqrtA_alpha;
  const double a1 = -2.0 * ((A - 1) + (A + 1) * cos_w0);
  const double a2 = (A + 1) + (A - 1) * cos_w0 - two_sqrtA_alpha;

  SetCoefficients(b0, b1, b2, a0, a1, a2);
}

void BiquadFilter::SetHighShelf(double sample_rate_hz, double corner_hz,
                                 double gain_db) {
  const double A = DbToA(gain_db);
  const double w0 = 2.0 * kPi * corner_hz / sample_rate_hz;
  const double cos_w0 = std::cos(w0);
  const double sin_w0 = std::sin(w0);
  const double Q = 0.707;
  const double alpha = sin_w0 / (2.0 * Q);
  const double sqrtA = std::sqrt(A);
  const double two_sqrtA_alpha = 2.0 * sqrtA * alpha;

  const double b0 = A * ((A + 1) + (A - 1) * cos_w0 + two_sqrtA_alpha);
  const double b1 = -2.0 * A * ((A - 1) + (A + 1) * cos_w0);
  const double b2 = A * ((A + 1) + (A - 1) * cos_w0 - two_sqrtA_alpha);
  const double a0 = (A + 1) - (A - 1) * cos_w0 + two_sqrtA_alpha;
  const double a1 = 2.0 * ((A - 1) - (A + 1) * cos_w0);
  const double a2 = (A + 1) - (A - 1) * cos_w0 - two_sqrtA_alpha;

  SetCoefficients(b0, b1, b2, a0, a1, a2);
}

void BiquadFilter::SetPeaking(double sample_rate_hz, double center_hz,
                               double gain_db, double q) {
  const double A = DbToA(gain_db);
  const double w0 = 2.0 * kPi * center_hz / sample_rate_hz;
  const double cos_w0 = std::cos(w0);
  const double sin_w0 = std::sin(w0);
  const double alpha = sin_w0 / (2.0 * q);

  const double b0 = 1.0 + alpha * A;
  const double b1 = -2.0 * cos_w0;
  const double b2 = 1.0 - alpha * A;
  const double a0 = 1.0 + alpha / A;
  const double a1 = -2.0 * cos_w0;
  const double a2 = 1.0 - alpha / A;

  SetCoefficients(b0, b1, b2, a0, a1, a2);
}

void BiquadFilter::ProcessInPlace(float* samples, int num_frames) {
  for (int i = 0; i < num_frames; ++i) {
    const double x0 = static_cast<double>(samples[i]);
    const double y0 = b0_ * x0 + b1_ * x1_ + b2_ * x2_ - a1_ * y1_ - a2_ * y2_;
    x2_ = x1_;
    x1_ = x0;
    y2_ = y1_;
    y1_ = y0;
    samples[i] = static_cast<float>(y0);
  }
}

void BiquadFilter::Reset() {
  x1_ = x2_ = y1_ = y2_ = 0.0;
}

AudioEqProcessor::AudioEqProcessor() = default;
AudioEqProcessor::~AudioEqProcessor() = default;

void AudioEqProcessor::SetGainsDb(double bass_db, double mid_db,
                                   double treble_db) {
  std::lock_guard<std::mutex> lock(mutex_);
  bass_db_ = bass_db;
  mid_db_ = mid_db;
  treble_db_ = treble_db;
  gains_changed_ = true;
}

void AudioEqProcessor::SetBoostDb(double boost_db) {
  std::lock_guard<std::mutex> lock(mutex_);
  boost_db_ = boost_db;
  boost_linear_ = std::pow(10.0, boost_db_ / 20.0);
}

void AudioEqProcessor::Initialize(int sample_rate_hz, int num_channels) {
  std::lock_guard<std::mutex> lock(mutex_);
  sample_rate_hz_ = sample_rate_hz > 0 ? sample_rate_hz : 48000;
  num_channels_ = num_channels > 0 ? num_channels : 1;
  // One sub-band assumed until a real Process() call says otherwise --
  // see the buffer-layout caveat in the header.
  filters_.assign(static_cast<size_t>(num_channels_),
                   std::vector<ThreeBandCascade>(1));
  gains_changed_ = true;
}

void AudioEqProcessor::RebuildFiltersLocked() {
  for (auto& channel_bands : filters_) {
    for (auto& cascade : channel_bands) {
      cascade.bass.SetLowShelf(sample_rate_hz_, /*corner_hz=*/200.0, bass_db_);
      cascade.mid.SetPeaking(sample_rate_hz_, /*center_hz=*/1000.0, mid_db_,
                              /*q=*/0.9);
      cascade.treble.SetHighShelf(sample_rate_hz_, /*corner_hz=*/4000.0,
                                   treble_db_);
    }
  }
  gains_changed_ = false;
}

void AudioEqProcessor::Process(int num_bands, int num_frames, int buffer_size,
                                float* buffer) {
  if (num_bands <= 0 || num_frames <= 0 || num_channels_ <= 0 ||
      buffer == nullptr) {
    return;
  }

  const long long per_channel =
      static_cast<long long>(num_bands) * static_cast<long long>(num_frames);
  if (per_channel <= 0 ||
      per_channel * num_channels_ != static_cast<long long>(buffer_size)) {
    // Doesn't match this implementation's layout assumption -- fail
    // safe and leave the buffer untouched rather than guess further.
    return;
  }

  std::lock_guard<std::mutex> lock(mutex_);

  // All-flat (EQ off and no boost, or a user who hasn't touched either)
  // is the common case -- skip every bit of the work below rather than
  // run three identity biquads plus a x1.0 multiply per sample.
  const bool boost_flat = (boost_db_ == 0.0);
  bool eq_flat = (bass_db_ == 0.0 && mid_db_ == 0.0 && treble_db_ == 0.0);
  if (!gains_changed_ && eq_flat && boost_flat) {
    return;
  }
  if (gains_changed_) {
    RebuildFiltersLocked();
    eq_flat = (bass_db_ == 0.0 && mid_db_ == 0.0 && treble_db_ == 0.0);
  }
  if (eq_flat && boost_flat) {
    return;
  }

  // Grow (never shrink) to whatever band count Process() actually
  // reports, if it's more than Initialize() implied. Unconditional even
  // when eq_flat (boost-only) so switching EQ on later mid-call doesn't
  // need another Initialize() to size correctly.
  for (auto& channel_bands : filters_) {
    if (channel_bands.size() < static_cast<size_t>(num_bands)) {
      const size_t old_size = channel_bands.size();
      channel_bands.resize(static_cast<size_t>(num_bands));
      for (size_t b = old_size; b < channel_bands.size(); ++b) {
        channel_bands[b].bass.SetLowShelf(sample_rate_hz_, 200.0, bass_db_);
        channel_bands[b].mid.SetPeaking(sample_rate_hz_, 1000.0, mid_db_, 0.9);
        channel_bands[b].treble.SetHighShelf(sample_rate_hz_, 4000.0,
                                              treble_db_);
      }
    }
  }

  // Extra parens around std::min defeat windows.h's own min/max macros
  // (defined unless NOMINMAX is set before including it, which this
  // shared plugin file doesn't control) -- without them this is a
  // notorious MSVC syntax error, not just a wrong-overload risk.
  const int usable_channels =
      (std::min)(num_channels_, static_cast<int>(filters_.size()));
  const float boost_linear = static_cast<float>(boost_linear_);
  for (int ch = 0; ch < usable_channels; ++ch) {
    float* channel_buffer = buffer + static_cast<long long>(ch) * per_channel;

    // Preamp/boost first (mirrors a real mixer's trim knob preceding
    // its tone controls), hard-clamped so a boosted signal can't wrap
    // on its way back into a float sample -- clipping is audible
    // distortion, wrapping is far worse.
    if (!boost_flat) {
      for (long long i = 0; i < per_channel; ++i) {
        const float boosted = channel_buffer[i] * boost_linear;
        channel_buffer[i] = (std::max)(-1.0f, (std::min)(1.0f, boosted));
      }
    }

    if (!eq_flat) {
      for (int band = 0; band < num_bands; ++band) {
        float* band_data = channel_buffer + static_cast<long long>(band) * num_frames;
        filters_[ch][band].ProcessInPlace(band_data, num_frames);
      }
    }
  }
}

void AudioEqProcessor::Reset(int new_rate) {
  std::lock_guard<std::mutex> lock(mutex_);
  sample_rate_hz_ = new_rate > 0 ? new_rate : sample_rate_hz_;
  for (auto& channel_bands : filters_) {
    for (auto& cascade : channel_bands) {
      cascade.bass.Reset();
      cascade.mid.Reset();
      cascade.treble.Reset();
    }
  }
  gains_changed_ = true;
}

void AudioEqProcessor::Release() {
  // Nothing to release -- no OS handles/native resources held beyond
  // this object's own memory, which its destructor already covers.
}

}  // namespace flutter_webrtc_plugin
