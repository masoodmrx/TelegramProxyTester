# Release preparation

## Android signing

Generate the upload keystore once and keep it backed up securely:

```powershell
keytool -genkeypair -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Add these GitHub repository secrets before running `Build Release Packages`:

- `ANDROID_KEYSTORE_BASE64`: base64 content of `upload-keystore.jks`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

The workflow creates `android/key.properties` only on the runner. The keystore
and properties file are ignored locally and must never be committed.

## Windows

The release workflow produces a ZIP containing the Windows Release folder.
