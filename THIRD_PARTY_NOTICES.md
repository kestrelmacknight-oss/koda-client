# Third-Party Notices

Koda's own source is not affected by this file -- it exists because two
dependencies are vendored and locally patched (`third_party/flutter_webrtc`,
reproduced by `tool/vendor_flutter_webrtc.ps1` from a pub.dev release plus
Koda-specific native patches under `native/`) rather than pulled in
unmodified, so their license terms and provenance aren't otherwise visible
to anyone auditing this repo.

## flutter_webrtc

- Source: https://pub.dev/packages/flutter_webrtc (version pinned in
  `tool/vendor_flutter_webrtc.ps1`'s `$PackageVersion`)
- License: MIT (see the vendored copy's own `LICENSE`/`NOTICE` files once
  `tool/vendor_flutter_webrtc.ps1` has been run -- not committed here,
  since `third_party/flutter_webrtc` itself is gitignored, a rebuildable
  artifact)
- Koda's copy is **not** upstream as-shipped: two local native patches are
  applied on top, both documented in `native/`:
  - `native/flutter_webrtc_eq_patch/` -- real 3-band mic EQ + preamp
    boost, applied before publish (Windows only).
  - `native/flutter_webrtc_rnnoise_patch/` -- RNNoise-based deep noise
    suppression, composed with the EQ patch above into a single capture
    processing chain (Windows only). See below.

## RNNoise

- Source: https://github.com/xiph/rnnoise
- Vendored at: `native/rnnoise/` (see `native/rnnoise/UPSTREAM.md` for the
  exact pinned commit, what's included/excluded, and full detail on
  everything below)
- License: BSD-3-Clause (see `native/rnnoise/COPYING`)
- **Model weights licensing -- open question, not a blocker.** The
  pretrained model weights (shipped separately from upstream's own git
  repo, fetched via `download_model.sh`, converted into Koda's compact
  `weights_blob.bin` -- see `native/rnnoise/UPSTREAM.md` for the exact
  provenance) don't carry an explicit license file of their own in
  upstream's distribution. This is the subject of an open, unresolved
  upstream issue: https://github.com/xiph/rnnoise/issues/284. It is
  **not** a dispute about redistribution rights -- every major downstream
  packager already ships this exact default model in binary form without
  objection or takedown (Debian and Gentoo treat it as BSD-3-Clause like
  the code, Fedora tags it CC0-1.0, and Microsoft's vcpkg port
  independently declares `"BSD-3-Clause AND CC0-1.0"`), and OBS Studio (a
  widely commercially-bundled application) has shipped the same model for
  years. Koda follows the same established practice. Worth revisiting if
  upstream ever publishes an authoritative answer on the open issue.
- Koda vendors only the runtime inference path (not the training
  pipeline, not the x86 SIMD dispatch path -- see
  `native/rnnoise/UPSTREAM.md` for exactly what's included and why), and
  ships the model weights as a separate compact binary
  (`weights_blob.bin`, embedded as a Windows resource) rather than as
  upstream's ~78MB generated C source file, for practical repo-size
  reasons -- functionally identical either way (same
  `parse_weights()`/`init_rnnoise()` code path).
