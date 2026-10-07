<#
.SYNOPSIS
  Reproduces third_party/flutter_webrtc -- a locally patched copy of the
  flutter_webrtc package, needed for the Windows mic EQ (real frequency
  shaping applied to the outgoing mic signal before it's published, see
  native/flutter_webrtc_eq_patch/audio_eq_processor.h) and RNNoise deep
  noise suppression (see native/flutter_webrtc_rnnoise_patch/audio_noise_suppressor.h),
  both of which need native code.

  third_party/flutter_webrtc is gitignored (it includes ~30MB of
  upstream's own bundled libwebrtc binaries, a rebuildable artifact, not
  something to commit) -- run this once after a fresh checkout, or
  whenever `flutter pub get` reports pubspec.lock resolved a different
  upstream flutter_webrtc version than PACKAGE_VERSION below (bump that
  constant and re-run to pick up the new version, then re-verify both
  patches still apply cleanly -- they're plain unified diffs against
  upstream's source, not guaranteed to survive every version bump
  untouched).

.DESCRIPTION
  1. Copies flutter_webrtc-$PACKAGE_VERSION fresh from the local pub
     cache into third_party/flutter_webrtc.
  2. Copies audio_eq_processor.h/.cc into place, applies eq_hooks.patch.
  3. Copies audio_noise_suppressor.{h,cc,rc}, audio_capture_chain.{h,cc},
     the vendored native/rnnoise/ sources, and weights_blob.bin into
     place, applies rnnoise_hooks.patch. This step runs strictly AFTER
     step 2 -- rnnoise_hooks.patch's hunks are authored against the
     already-eq_hooks.patch'd state of the files it touches (it changes
     wiring eq_hooks.patch itself added, e.g. renaming the single
     CustomProcessing accessor from audio_eq_processor() to
     audio_capture_chain()), not against pristine upstream.

  Cross-platform (needs PowerShell Core, i.e. `pwsh` -- preinstalled on
  every GitHub-hosted runner, Windows/macOS/Linux alike) because
  pubspec.yaml's dependency_overrides applies to every platform's `pub
  get`, not just Windows's -- even though the native EQ/RNNoise code
  only ever activates on Windows, macOS/Linux/Android/iOS builds still
  need *something* at third_party/flutter_webrtc or `pub get` fails
  outright with a missing-path error before any of that matters. See
  .github/workflows/build-release.yml, which runs this on all five
  platform jobs.
#>

$PackageVersion = "1.6.0"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$EqPatchDir = Join-Path $RepoRoot "native/flutter_webrtc_eq_patch"
$RnnoisePatchDir = Join-Path $RepoRoot "native/flutter_webrtc_rnnoise_patch"
$RnnoiseSrcDir = Join-Path $RepoRoot "native/rnnoise"
$VendorDir = Join-Path $RepoRoot "third_party/flutter_webrtc"

# Dart's own PUB_CACHE override wins if set, matching how `dart`/`flutter`
# itself resolves the cache -- otherwise each OS's real default location,
# which is NOT the same path shape on Windows vs macOS/Linux.
if ($env:PUB_CACHE) {
    $PubCacheRoot = $env:PUB_CACHE
} elseif ($IsWindows -or (-not (Test-Path variable:IsWindows))) {
    # $IsWindows only exists on PowerShell Core (6+) -- Windows
    # PowerShell 5.1 (powershell.exe) has no such variable and is
    # always Windows, so its absence defaults to true here too.
    $PubCacheRoot = Join-Path $env:LOCALAPPDATA "Pub/Cache"
} else {
    $PubCacheRoot = Join-Path $env:HOME ".pub-cache"
}
$PubCacheDir = Join-Path $PubCacheRoot "hosted/pub.dev/flutter_webrtc-$PackageVersion"

if (-not (Test-Path $PubCacheDir)) {
    # A fresh CI runner's pub cache starts empty -- there's no prior
    # `pub get` to have populated it, and pubspec.yaml's own
    # dependency_overrides means a normal `pub get` never will (it
    # always resolves flutter_webrtc from the path override instead).
    # `dart pub cache add` downloads one specific package+version
    # straight into the cache without needing it as a project
    # dependency at all -- exactly this bootstrapping case.
    Write-Host "flutter_webrtc-$PackageVersion not in the pub cache -- fetching it directly ..."
    dart pub cache add flutter_webrtc --version $PackageVersion
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path $PubCacheDir)) {
        Write-Error "Could not fetch flutter_webrtc-$PackageVersion into the pub cache at $PubCacheDir."
        exit 1
    }
}

if (Test-Path $VendorDir) {
    Write-Host "Removing existing $VendorDir ..."
    Remove-Item -Recurse -Force $VendorDir
}

Write-Host "Copying flutter_webrtc-$PackageVersion from the pub cache ..."
Copy-Item -Recurse -Force $PubCacheDir $VendorDir

# Applies one patch file, first normalizing to LF the exact set of files
# it touches (parsed from its own "+++ b/..." headers, rather than a
# hardcoded list that could drift from the patch). Upstream ships at
# least one file (windows/CMakeLists.txt) with real, permanent CRLF line
# endings baked into the published pub.dev package itself -- confirmed
# against a genuinely fresh `dart pub cache add` fetch, not a checkout
# artifact. git apply on Windows happens to tolerate that mismatch
# (core.autocrlf's usual default there), but a strict Linux/macOS
# `git apply` does an exact byte match and fails on that one hunk. Line
# endings carry no meaning to CMake/C++/Dart parsers, so normalizing is a
# safe, permanent fix rather than relying on whichever platform's git
# happens to be lenient.
function Apply-VendorPatch {
    param([string]$PatchFile, [string]$Description)

    Write-Host "Normalizing line endings of patched files to LF ($Description) ..."
    $patchedRelPaths = Select-String -Path $PatchFile -Pattern '^\+\+\+ b/(.+)$' |
        ForEach-Object { $_.Matches[0].Groups[1].Value.Trim() }
    foreach ($relPath in $patchedRelPaths) {
        $fullPath = Join-Path $VendorDir $relPath
        if (Test-Path $fullPath) {
            $text = [System.IO.File]::ReadAllText($fullPath)
            $normalized = $text -replace "`r`n", "`n"
            if ($normalized -ne $text) {
                [System.IO.File]::WriteAllText($fullPath, $normalized, (New-Object System.Text.UTF8Encoding($false)))
            }
        }
    }

    Write-Host "Applying $Description ..."
    Push-Location $VendorDir
    # $VendorDir sits inside the main Koda git repo but is itself
    # gitignored (see .gitignore's /third_party/flutter_webrtc/ rule) --
    # without a ceiling, `git apply` walks up, discovers that enclosing
    # repo, and resolves the patch's paths as repo-root-relative
    # ("third_party/flutter_webrtc/common/..."), which then match the
    # gitignore rule and get silently skipped ("Skipped patch '...'.",
    # exit code 0 -- no error, just quietly not applied). Observed to be
    # timing/state-dependent (not reliably reproducible every run), which
    # makes it worse, not better -- setting the ceiling to $VendorDir's
    # own parent forces git to stop its repo search right at $VendorDir,
    # so it never finds the enclosing repo and just does plain textual
    # patching relative to the current directory, deterministically.
    $previousCeiling = $env:GIT_CEILING_DIRECTORIES
    $env:GIT_CEILING_DIRECTORIES = Split-Path -Parent $VendorDir
    try {
        git apply --verbose $PatchFile
        if ($LASTEXITCODE -ne 0) {
            Write-Error "$Description failed to apply -- re-diff by hand against the new upstream/prior-patch version."
            exit 1
        }
    } finally {
        $env:GIT_CEILING_DIRECTORIES = $previousCeiling
        Pop-Location
    }
}

# git apply respects core.autocrlf when it writes the patched file back
# to disk -- on a Windows runner/machine with the (very common) default
# core.autocrlf=true, that silently reintroduces CRLF into files
# Apply-VendorPatch just normalized to LF going *into* the patch. Same
# "line endings carry no meaning to CMake/C++ parsers, normalizing is a
# safe permanent fix" stance as Apply-VendorPatch's own normalization --
# re-applied after patching, right before the plain-text substitutions
# below that depend on matching an exact (LF) marker string.
function Normalize-ToLF {
    param([string]$Path)
    $text = [System.IO.File]::ReadAllText($Path)
    $normalized = $text -replace "`r`n", "`n"
    if ($normalized -ne $text) {
        [System.IO.File]::WriteAllText($Path, $normalized, (New-Object System.Text.UTF8Encoding($false)))
    }
}

# Every multi-line marker/insertion string below is built from a
# PowerShell here-string literally embedded in *this* .ps1 file -- its
# line endings come from however this script file itself happens to be
# saved on disk (CRLF under the same core.autocrlf=true that
# necessitates Normalize-ToLF above), not from any deliberate choice at
# the call site. Routing every such string through this before matching
# against/inserting into an already-LF-normalized target file keeps the
# comparison byte-exact regardless of this script's own line endings.
function ConvertTo-LF {
    param([string]$Text)
    return $Text -replace "`r`n", "`n"
}

Write-Host "Adding audio_eq_processor.h/.cc ..."
Copy-Item -Force (Join-Path $EqPatchDir "audio_eq_processor.h") (Join-Path $VendorDir "windows\audio_eq_processor.h")
Copy-Item -Force (Join-Path $EqPatchDir "audio_eq_processor.cc") (Join-Path $VendorDir "windows\audio_eq_processor.cc")
Apply-VendorPatch (Join-Path $EqPatchDir "eq_hooks.patch") "eq_hooks.patch"

Write-Host "Adding vendored RNNoise sources ..."
Copy-Item -Recurse -Force $RnnoiseSrcDir (Join-Path $VendorDir "windows\rnnoise")
# UPSTREAM.md/COPYING travel with the source tree above but aren't build
# inputs -- harmless to have alongside, left in place rather than pruned.

Write-Host "Adding audio_noise_suppressor.{h,cc,rc} and audio_capture_chain.{h,cc} ..."
Copy-Item -Force (Join-Path $RnnoisePatchDir "audio_noise_suppressor.h") (Join-Path $VendorDir "windows\audio_noise_suppressor.h")
Copy-Item -Force (Join-Path $RnnoisePatchDir "audio_noise_suppressor.cc") (Join-Path $VendorDir "windows\audio_noise_suppressor.cc")
Copy-Item -Force (Join-Path $RnnoisePatchDir "audio_noise_suppressor.rc") (Join-Path $VendorDir "windows\audio_noise_suppressor.rc")
Copy-Item -Force (Join-Path $RnnoisePatchDir "audio_capture_chain.h") (Join-Path $VendorDir "windows\audio_capture_chain.h")
Copy-Item -Force (Join-Path $RnnoisePatchDir "audio_capture_chain.cc") (Join-Path $VendorDir "windows\audio_capture_chain.cc")
Apply-VendorPatch (Join-Path $RnnoisePatchDir "rnnoise_hooks.patch") "rnnoise_hooks.patch"

# The four files the substitutions below match against by exact (LF)
# marker string -- see Normalize-ToLF's own comment for why this needs
# re-running after git apply, not just before it.
Write-Host "Re-normalizing line endings after patching (git apply/core.autocrlf can reintroduce CRLF) ..."
foreach ($relPath in @(
    "windows\CMakeLists.txt",
    "common\cpp\include\flutter_webrtc_base.h",
    "common\cpp\src\flutter_webrtc_base.cc",
    "common\cpp\src\flutter_webrtc.cc"
)) {
    Normalize-ToLF (Join-Path $VendorDir $relPath)
}

# Upstream RNNoise/Opus C source trips MSVC's /WX (warnings-as-errors,
# set by apply_standard_settings in this same CMakeLists.txt) on
# ordinary double<->float narrowing that upstream itself doesn't treat
# as an error -- a plain text insertion here rather than another hunk
# in rnnoise_hooks.patch, since this just needs to land right after the
# source list that patch already adds, not interleave with it.
Write-Host "Suppressing warnings-as-errors for vendored RNNoise/Opus sources ..."
$CMakeListsPath = Join-Path $VendorDir "windows\CMakeLists.txt"
$cmakeContent = Get-Content $CMakeListsPath -Raw
$marker = 'PROPERTIES COMPILE_DEFINITIONS "USE_WEIGHTS_FILE"' + "`n)`n"
if ($cmakeContent -notmatch [regex]::Escape($marker)) {
    Write-Error "Could not find the USE_WEIGHTS_FILE block in $CMakeListsPath -- rnnoise_hooks.patch's shape may have changed."
    exit 1
}
$suppression = ConvertTo-LF @'

# Upstream RNNoise/Opus C source is full of intentional double<->float
# narrowing (routine, harmless in DSP code -- upstream itself doesn't
# build with /WX) that apply_standard_settings' /WX above turns into
# hard build failures on MSVC. Carved out for just these vendored files
# -- never touch their math to silence this, and never relax warnings
# for anything else in this shared plugin target.
set_source_files_properties(
  "rnnoise/src/denoise.c"
  "rnnoise/src/rnn.c"
  "rnnoise/src/pitch.c"
  "rnnoise/src/kiss_fft.c"
  "rnnoise/src/celt_lpc.c"
  "rnnoise/src/nnet.c"
  "rnnoise/src/nnet_default.c"
  "rnnoise/src/parse_lpcnet_weights.c"
  "rnnoise/src/rnnoise_tables.c"
  "rnnoise/src/rnnoise_data.c"
  PROPERTIES COMPILE_OPTIONS "/WX-"
)

'@
$cmakeContent = $cmakeContent.Replace($marker, $marker + $suppression)
Set-Content -Path $CMakeListsPath -Value $cmakeContent -NoNewline

# flutter_webrtc_base.h's #include "audio_capture_chain.h" (added by
# rnnoise_hooks.patch) is a *public*, shared header -- other plugins
# that depend on flutter_webrtc's C++ API (livekit_client, concretely)
# include it too, and their own CMake targets have no reason to carry
# RNNoise's include path (rnnoise/include), so they fail with "cannot
# open rnnoise.h". Fixed the same way as the /WX- carve-out above: a
# plain text substitution rather than another rnnoise_hooks.patch hunk,
# swapping the #include for a forward declaration (sufficient -- only a
# pointer return type and a unique_ptr member need the name in this
# header; ~FlutterWebRTCBase(), where the unique_ptr's deleter is
# actually instantiated, is defined out-of-line in
# flutter_webrtc_base.cc, which gets its own direct #include below).
Write-Host "Forward-declaring AudioCaptureChain in the public base header ..."
$BaseHeaderPath = Join-Path $VendorDir "common\cpp\include\flutter_webrtc_base.h"
$baseHeaderContent = Get-Content $BaseHeaderPath -Raw
$includeBlock = ConvertTo-LF @"
// Real mic EQ + RNNoise deep noise suppression -- Windows only for now,
// see audio_capture_chain.h for why this lives there and why it's gated
// behind _WIN32 in this otherwise cross-desktop-platform shared file.
#if defined(_WIN32)
#include "audio_capture_chain.h"
#endif

namespace flutter_webrtc_plugin {

using namespace libwebrtc;

class FlutterVideoRenderer;
class FlutterRTCDataChannelObserver;
class FlutterPeerConnectionObserver;
"@
if ($baseHeaderContent -notmatch [regex]::Escape($includeBlock)) {
    Write-Error "Could not find the expected audio_capture_chain.h #include block in $BaseHeaderPath -- rnnoise_hooks.patch's shape may have changed."
    exit 1
}
$forwardDeclBlock = ConvertTo-LF @'
namespace flutter_webrtc_plugin {

using namespace libwebrtc;

class FlutterVideoRenderer;
class FlutterRTCDataChannelObserver;
class FlutterPeerConnectionObserver;
// Real mic EQ + RNNoise deep noise suppression -- Windows only for now,
// see audio_capture_chain.h for why this lives there and why it's gated
// behind _WIN32 in this otherwise cross-desktop-platform shared file. A
// forward declaration, not #include "audio_capture_chain.h", on
// purpose -- see this script's own comment just above for why.
#if defined(_WIN32)
class AudioCaptureChain;
#endif
'@
$baseHeaderContent = $baseHeaderContent.Replace($includeBlock, $forwardDeclBlock)
Set-Content -Path $BaseHeaderPath -Value $baseHeaderContent -NoNewline

# The two .cc files that actually construct/destroy/call methods on an
# AudioCaptureChain now need their own direct #include, since the
# public header above no longer provides it transitively.
Write-Host "Adding direct audio_capture_chain.h includes to flutter_webrtc_base.cc and flutter_webrtc.cc ..."
$directIncludeComment = ConvertTo-LF @'
// flutter_webrtc_base.h only forward-declares AudioCaptureChain (see its
// own comment) -- this file needs the full type to construct one and
// to let ~FlutterWebRTCBase() destroy it via unique_ptr.
#if defined(_WIN32)
#include "audio_capture_chain.h"
#endif

'@
$BaseCcPath = Join-Path $VendorDir "common\cpp\src\flutter_webrtc_base.cc"
$baseCcContent = Get-Content $BaseCcPath -Raw
$baseCcMarker = '#include "flutter_webrtc_base.h"' + "`n`n"
if ($baseCcContent -notmatch [regex]::Escape($baseCcMarker)) {
    Write-Error "Could not find the expected #include block in $BaseCcPath -- rnnoise_hooks.patch's shape may have changed."
    exit 1
}
$baseCcContent = $baseCcContent.Replace($baseCcMarker, $baseCcMarker + $directIncludeComment)
Set-Content -Path $BaseCcPath -Value $baseCcContent -NoNewline

$webrtcCcDirectIncludeComment = ConvertTo-LF @'
// flutter_webrtc_base.h (included transitively via flutter_webrtc.h)
// only forward-declares AudioCaptureChain -- this file calls real
// methods on it (eq_processor()/noise_suppressor()) below, so it needs
// the full type directly.
#if defined(_WIN32)
#include "audio_capture_chain.h"
#endif

'@
$WebrtcCcPath = Join-Path $VendorDir "common\cpp\src\flutter_webrtc.cc"
$webrtcCcContent = Get-Content $WebrtcCcPath -Raw
$webrtcCcMarker = '#include "flutter_webrtc.h"' + "`n" + '#include "flutter_data_channel.h"' + "`n`n"
if ($webrtcCcContent -notmatch [regex]::Escape($webrtcCcMarker)) {
    Write-Error "Could not find the expected #include block in $WebrtcCcPath -- rnnoise_hooks.patch's shape may have changed."
    exit 1
}
$webrtcCcContent = $webrtcCcContent.Replace($webrtcCcMarker, $webrtcCcMarker + $webrtcCcDirectIncludeComment)
Set-Content -Path $WebrtcCcPath -Value $webrtcCcContent -NoNewline

Write-Host "Done. Run 'flutter pub get' (dependency_overrides in pubspec.yaml already points at third_party/flutter_webrtc)."
