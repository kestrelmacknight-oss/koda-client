# Vendored RNNoise

Source: https://github.com/xiph/rnnoise
Commit: `70f1d256acd4b34a572f999a05c87bf00b67730` (main, 2025-02-22)
License: BSD-3-Clause (see `COPYING`)

## What's vendored, and what isn't

Only the runtime inference path is vendored -- upstream's training-only
files (`src/dump_features.c`, `src/write_weights.c`, `src/rnn_train.py`,
everything under `training/`, `torch/`) are excluded entirely, as is the
x86 SIMD runtime-dispatch path (`src/x86/*.c`, gated behind
`RNN_ENABLE_X86_RTCD`, which Koda's build does not define -- see
`native/flutter_webrtc_rnnoise_patch/rnnoise_hooks.patch`). This is a
portable/generic-C build; SIMD dispatch is a documented future
optimization, not required for correctness (RNNoise is already ~60x
realtime unoptimized on typical x86 hardware).

`src/rnnoise_data.c` is **not** upstream's file. Upstream's own version
of this file is ~78MB of decimal float-literal arrays -- the model's
compiled-in weights -- which is impractical to vendor as source (repo
bloat, slow compiles, unreadable diffs). Koda's `src/rnnoise_data.c`
contains only the one function from that file that has no dependency on
the literal-array data, `init_rnnoise()` (copied verbatim -- it's fixed
wiring code describing the model's fixed layer architecture, not
per-training-run data). The actual trained weights ship separately as
`weights_blob.bin`, embedded as a Windows resource and loaded at runtime
via `rnnoise_model_from_buffer()` + `parse_weights()` -- the exact same
code path upstream's own `USE_WEIGHTS_FILE` build mode already uses, so
behavior is identical to compiling the weights in directly.

## `weights_blob.bin` provenance

Built from the same commit's pinned model release:
- `model_version` (this commit): `0a8755f8e2d834eff6a54714ecc7d75f9932e845df35f8b59bc52a7cfe6e8b37`
- Fetched from `https://media.xiph.org/rnnoise/models/rnnoise_data-<hash>.tar.gz`,
  matching `download_model.sh`'s own fetch+verify step (sha256 confirmed
  against `model_version` before use).
- Converted from the tarball's `src/rnnoise_data.c` (the default,
  full-size model -- not the smaller `rnnoise_data_little` variant) into
  the compact `weights_blob.bin` binary format via a one-off Node.js
  script (`write_weights.c`'s own binary layout, replicated without
  needing a C compiler -- see git history for the conversion script if
  it's ever needed again). Verified the binary format precisely against
  `src/parse_lpcnet_weights.c`'s `parse_record()`/`WeightHead` struct.
  14.75 MB, vs. 78 MB for the equivalent C source.

## Model weights licensing -- open question, not blocking

The model weights' exact SPDX license tag is the subject of an open,
unresolved upstream issue distinct from the code's unambiguous
BSD-3-Clause license: https://github.com/xiph/rnnoise/issues/284

This is not a dispute about redistribution rights -- Debian, Fedora,
Gentoo, and OBS Studio (a widely commercially-bundled app) all already
ship this same default model in binary form. See
`THIRD_PARTY_NOTICES.md` at the repo root for the full context.

## Updating this vendored copy

There's no automated re-vendor script for RNNoise itself (unlike
`flutter_webrtc`, which regenerates from a versioned pub.dev release via
`tool/vendor_flutter_webrtc.ps1`) -- bumping the pinned commit is a
manual process: re-run the same file-selection process against the new
commit (see the exclusion list above), and re-run `download_model.sh`'s
fetch+verify (or re-run the blob-conversion step) if the model itself
has also changed upstream.
