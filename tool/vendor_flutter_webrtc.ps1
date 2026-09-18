<#
.SYNOPSIS
  Reproduces third_party/flutter_webrtc -- a locally patched copy of the
  flutter_webrtc package, needed for the Windows mic EQ (real frequency
  shaping applied to the outgoing mic signal before it's published, see
  native/flutter_webrtc_eq_patch/audio_eq_processor.h for why this
  needs native code at all).

  third_party/flutter_webrtc is gitignored (it includes ~30MB of
  upstream's own bundled libwebrtc binaries, a rebuildable artifact, not
  something to commit) -- run this once after a fresh checkout, or
  whenever `flutter pub get` reports pubspec.lock resolved a different
  upstream flutter_webrtc version than PACKAGE_VERSION below (bump that
  constant and re-run to pick up the new version, then re-verify the
  patch still applies cleanly -- it's a plain unified diff against
  upstream's source, not guaranteed to survive every version bump
  untouched).

.DESCRIPTION
  1. Copies flutter_webrtc-$PACKAGE_VERSION fresh from the local pub
     cache into third_party/flutter_webrtc.
  2. Copies the two new files (audio_eq_processor.h/.cc) into place.
  3. Applies eq_hooks.patch (the small diff against 6 existing upstream
     files: 4 native, 2 Dart) on top.

  Cross-platform (needs PowerShell Core, i.e. `pwsh` -- preinstalled on
  every GitHub-hosted runner, Windows/macOS/Linux alike) because
  pubspec.yaml's dependency_overrides applies to every platform's `pub
  get`, not just Windows's -- even though the native EQ/boost code only
  ever activates on Windows (see audio_eq_processor.h), macOS/Linux/
  Android/iOS builds still need *something* at third_party/flutter_webrtc
  or `pub get` fails outright with a missing-path error before any of
  that matters. See .github/workflows/build-release.yml, which runs
  this on all five platform jobs.
#>

$PackageVersion = "1.6.0"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$PatchDir = Join-Path $RepoRoot "native/flutter_webrtc_eq_patch"
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

Write-Host "Adding audio_eq_processor.h/.cc ..."
Copy-Item -Force (Join-Path $PatchDir "audio_eq_processor.h") (Join-Path $VendorDir "windows\audio_eq_processor.h")
Copy-Item -Force (Join-Path $PatchDir "audio_eq_processor.cc") (Join-Path $VendorDir "windows\audio_eq_processor.cc")

Write-Host "Applying eq_hooks.patch ..."
$patchFile = Join-Path $PatchDir "eq_hooks.patch"
Push-Location $VendorDir
try {
    git apply --verbose $patchFile
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Patch failed to apply -- see native/flutter_webrtc_eq_patch/eq_hooks.patch and re-diff by hand against the new upstream version."
        exit 1
    }
} finally {
    Pop-Location
}

Write-Host "Done. Run 'flutter pub get' (dependency_overrides in pubspec.yaml already points at third_party/flutter_webrtc)."
