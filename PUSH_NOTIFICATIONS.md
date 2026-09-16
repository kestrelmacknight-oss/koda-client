# Mobile push notifications

Everything in this repo and in koda-server for mobile push (Android +
iOS system-tray notifications, delivered even while the app is
backgrounded or fully killed) is already wired up and builds/runs fine
without any of this -- push registration just fails closed at runtime
(see `lib/core/push_notifications.dart`) and the server treats it as
unconfigured (see koda-server's `Koda.Push.enabled?/0`). This is what's
left to actually turn it on: one Firebase project, shared by both
platforms and the server.

Desktop (Windows/macOS/Linux) is untouched by any of this -- it already
has its own tray notifications (`local_notifier`) over the app's live
socket connection, and doesn't need Firebase at all.

## 1. Create the Firebase project

At [console.firebase.google.com](https://console.firebase.google.com),
create a project (any name -- "Koda" is fine). Firebase Cloud Messaging
is enabled by default on a new project, nothing extra to turn on there.

## 2. Register the Android app

Project settings (gear icon) -> your apps -> Add app -> Android.

- Android package name: `com.gryphonheart.koda` (matches `applicationId`
  in `android/app/build.gradle.kts`)
- Download the generated `google-services.json`

**Local builds**: drop it at `android/app/google-services.json`
(gitignored, never committed -- see `.gitignore`). Once it's there,
`android/app/build.gradle.kts` automatically applies the Google Services
Gradle plugin; without it, that step is skipped and the build still
works, just without push.

**CI builds**: add repository secret `GOOGLE_SERVICES_JSON_BASE64` (the
whole file, base64-encoded: `base64 -i google-services.json | pbcopy` on
macOS, or `certutil -encode google-services.json tmp.b64` on Windows and
strip the header/footer lines) on the **koda-client** repo. Once set,
`build-android` in `.github/workflows/build-release.yml` decodes it
automatically.

## 3. Register the iOS app

Same Firebase project settings page -> Add app -> iOS.

- iOS bundle ID: `com.gryphonheart.koda` (matches
  `PRODUCT_BUNDLE_IDENTIFIER` in `ios/Runner.xcodeproj/project.pbxproj`,
  same value `ios/SIGNING.md` already references)
- Download the generated `GoogleService-Info.plist`

**Local builds**: drop it at `ios/Runner/GoogleService-Info.plist`
(gitignored). **CI builds**: add repository secret
`GOOGLE_SERVICE_INFO_PLIST_BASE64` (same base64 approach as above) on
**koda-client** -- `build-ios` decodes it automatically.

**Xcode capabilities** (one-time, needs Xcode -- this can't be done by
hand-editing files safely, same reasoning as the signing steps in
`ios/SIGNING.md`): open `ios/Runner.xcworkspace` in Xcode, select the
Runner target -> Signing & Capabilities -> `+ Capability` -> add **Push
Notifications**, then add **Background Modes** and check **Remote
notifications**. Xcode creates and wires up `Runner.entitlements` for
you when you do this.

**APNs key** (separate from the push capability above -- this is what
lets Firebase actually deliver to Apple's push servers): in your Apple
Developer account, Certificates, Identifiers & Profiles -> Keys -> create
an **Apple Push Notifications service (APNs)** key, download the `.p8`
file (only downloadable once), and note its Key ID and your Team ID.
Then in the Firebase console: Project settings -> Cloud Messaging ->
Apple app configuration -> APNs Authentication Key -> upload that `.p8`
with its Key ID and Team ID.

Also confirm the App ID registered in `ios/SIGNING.md` step 1 has the
**Push Notifications** capability checked (Apple Developer -> Identifiers
-> your App ID -> capabilities list) -- if you created it before this
step, edit it to add the capability, then regenerate the provisioning
profile from `ios/SIGNING.md` step 3 so it picks up the new entitlement.

## 4. Server: create a service account key

Firebase console -> Project settings -> Service accounts -> **Generate
new private key**. This downloads a JSON file -- it's a real credential
(it can send push as your Firebase project), treat it like the Stripe
secret key.

Set two env vars on koda-server (Railway service variables, same place
`LIVEKIT_API_KEY`/`STRIPE_SECRET_KEY`/etc. already live -- see
`config/runtime.exs`):

| Variable | Value |
|---|---|
| `PUSH_FCM_PROJECT_ID` | the Firebase project's ID (Project settings -> General -> Project ID, *not* the display name) |
| `PUSH_SERVICE_ACCOUNT_JSON` | the **entire contents** of the downloaded JSON file, pasted as-is (not a path) |

Once both are set, `Koda.Push.enabled?/0` goes true and
`Koda.Notifications.notify_and_push/5` (mentions, DM messages, payment
confirmations -- everything that already produces an in-app notification
today) starts also sending mobile push, with no further code changes.

## 5. Verify

There's no local Elixir/Android/Xcode toolchain available while this was
built, so none of it has been run for real -- this is all manual review
against Firebase's and Apple's documented flows, same caveat
`ios/SIGNING.md` already carries for the signing path. After setting
everything above: install a real build on a device, back the app out to
the home screen (or fully kill it), and have someone DM you or mention
you -- a system notification should appear titled like "Alex sent you a
message" (never the message content, matching the in-app toast's privacy
rule in `lib/shared/toast.dart`). If nothing arrives, check the server
logs for `[Push]` warnings first (a bad service-account JSON or an
un-uploaded APNs key both show up there), then re-check the Xcode
capability step for iOS specifically -- that one has no config-file
signal to catch a mistake the way the JSON/plist files do.

## What's deliberately not built yet

- **Tapping a push notification doesn't deep-link to the specific
  channel/DM** -- it just opens the app to wherever it would normally
  land (last session state), same as a cold launch. The notification's
  `data` payload already carries `channel_id`/`conversation_id` server-side
  (see `Koda.Push.send_to_user/4`'s callers), so wiring this up later is
  a matter of adding `FirebaseMessaging.onMessageOpenedApp` and
  `FirebaseMessaging.instance.getInitialMessage()` listeners to
  `lib/core/push_notifications.dart` (neither exists there yet) and
  routing on their payload -- a contained follow-up, not a redesign.
- **No background data-message processing** -- only `notification`-style
  FCM payloads are sent, which the OS displays on its own. There's no
  `FirebaseMessaging.onBackgroundMessage` handler, so nothing runs
  silently in the background beyond what iOS/Android already do for a
  standard push (e.g. no local unread-badge-count sync while killed).
