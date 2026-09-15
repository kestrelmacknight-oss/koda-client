# iOS release signing

CI always builds an unsigned `.app` (`flutter build ios --release
--no-codesign`) — that's a real build-correctness check (catches broken
Info.plist entries, plugin incompatibilities, etc.) and needs nothing
from you. It cannot be installed on a device or submitted anywhere
though. Producing an actual signed `.ipa` needs an Apple Developer
Program enrollment ($99/year) and these one-time steps.

## 1. App ID

In [developer.apple.com](https://developer.apple.com) → Certificates,
Identifiers & Profiles → Identifiers, register `com.gryphonheart.koda`
as an App ID (matches `PRODUCT_BUNDLE_IDENTIFIER` in
`ios/Runner.xcodeproj/project.pbxproj`).

## 2. Distribution certificate

Certificates → create an **Apple Distribution** certificate, download
it, then export it from Keychain Access as a `.p12` with a password you
choose (right-click the cert → Export).

## 3. Provisioning profile

Profiles → create an **App Store** distribution profile for the App ID
above, using the distribution certificate from step 2. Download it —
it's a `.mobileprovision` file.

## 4. Find your Team ID

Apple Developer account → Membership details, or run
`security cms -D -i profile.mobileprovision` on the downloaded profile
and look for `TeamIdentifier`.

## 5. GitHub Actions secrets

Add these as repository secrets on **koda-client**:

| Secret | Value |
|---|---|
| `IOS_DIST_CERT_BASE64` | `base64 -i DistCert.p12 \| pbcopy` |
| `IOS_DIST_CERT_PASSWORD` | the password you set exporting the .p12 |
| `IOS_PROVISION_PROFILE_BASE64` | `base64 -i profile.mobileprovision \| pbcopy` |
| `IOS_KEYCHAIN_PASSWORD` | any password — used only for the throwaway CI keychain, not tied to your Apple account |
| `IOS_TEAM_ID` | your 10-character Apple Team ID |

Once all five are set, `build-ios` in
`.github/workflows/build-release.yml` automatically imports the
certificate into a temporary keychain, installs the provisioning
profile, and produces a signed `.ipa` ready for TestFlight/App Store
upload — nothing else to do. This path is untested against a real
Apple account as of writing (no Apple Developer enrollment was
available to verify it against) — the first real run after adding
these secrets is the actual test; check the Actions log if it fails,
the most likely culprits are a provisioning-profile/certificate
mismatch or the profile's bundle ID not matching exactly.

## 6. Uploading to App Store Connect

The workflow produces the `.ipa` as a build artifact; uploading it to
App Store Connect itself (via Transporter.app, `xcrun altool`, or
`fastlane pilot`) is a separate manual step the first time. Automating
that too is a reasonable next step once you're actually shipping builds
regularly, using an App Store Connect API key instead of another set of
account credentials in CI.

## 7. First-time App Store Connect setup (not something CI can do for you)

- Create the app record in App Store Connect with `com.gryphonheart.koda`
- Fill in the store listing: screenshots, description, privacy policy
  URL (already have one: `https://koda.fyi/privacy.html`), age rating,
  App Privacy details (what data Koda collects)
- Answer the Export Compliance questions at submission time -- see the
  comment in `ios/Runner/Info.plist` next to where
  `ITSAppUsesNonExemptEncryption` would go; this is a real legal
  classification (Koda ships its own E2EE), not something to guess at
