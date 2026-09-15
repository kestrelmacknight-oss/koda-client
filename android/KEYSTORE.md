# Android release signing

Release builds fall back to debug signing until `android/key.properties`
exists — safe for CI and local builds, but **not accepted by Google
Play**. Do this once, when you're ready to actually upload to Play
Console.

## 1. Generate an upload keystore

```
keytool -genkey -v -keystore koda-upload.jks -keyalg RSA -keysize 2048 -validity 10000 -alias koda
```

You'll be prompted for a store password, a key password, and your
name/org details for the certificate. **Back up `koda-upload.jks` and
both passwords somewhere durable and secret** (a password manager, not
this repo) — if you lose it, you cannot update the app on Play Store
under the same listing ever again; Google's own key-loss recovery
process is slow and not guaranteed.

## 2. Local builds (optional)

Drop the file at `android/app/koda-upload.jks` and create
`android/key.properties` (both are gitignored, never commit them):

```
storePassword=<your store password>
keyPassword=<your key password>
keyAlias=koda
storeFile=koda-upload.jks
```

`flutter build appbundle --release` / `flutter build apk --release`
will now sign with it automatically — nothing else to change.

## 3. CI builds (GitHub Actions)

Add these as repository secrets (Settings → Secrets and variables →
Actions) on the **koda-client** repo:

| Secret | Value |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | `base64 -i koda-upload.jks \| pbcopy` (macOS) or `certutil -encode koda-upload.jks tmp.b64` (Windows, strip the header/footer lines) — the whole base64 blob |
| `ANDROID_KEYSTORE_PASSWORD` | your store password |
| `ANDROID_KEY_ALIAS` | `koda` (or whatever alias you used) |
| `ANDROID_KEY_PASSWORD` | your key password |

Once all four are set, `build-android` in
`.github/workflows/build-release.yml` automatically decodes the
keystore and produces a properly signed `.aab` (upload this to Play
Console) and `.apk` on every build — nothing else to do. Until then, it
still builds and uploads an unsigned-for-testing artifact so the
pipeline keeps working.

## 4. First-time Play Console setup (not something CI can do for you)

- Enroll in the Google Play Console ($25 one-time)
- Create the app listing, set `com.gryphonheart.koda` as the package name
- Upload the first `.aab` manually through the console (subsequent ones
  can go through the Play Developer API if you want full automation later)
- Fill in the store listing: screenshots, description, privacy policy
  URL (already have one: `https://koda.fyi/privacy.html`), content rating
  questionnaire, data safety form
