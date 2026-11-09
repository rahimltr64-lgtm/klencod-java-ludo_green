# Ludo Classic Green Mod

This is a modded version of Ludo Classic (package: com.whiture.apps.ludoorg).

## How to sign and install

1. Make sure you have Android build-tools (apksigner) and Java installed.
2. Run:
   ```bash
   ./sign_and_make_apks.sh
   ```
3. This will create `Ludo_Classic_green.apks`.
4. Install with SAI (Split APKs Installer) app, or:
   ```bash
   adb install-multiple signed/*.apk
   ```

**Important:** Uninstall the original Ludo Classic first because the signature is different.

## Files

- `apks/` : Original base + split APKs
- `sign_and_make_apks.sh` : Script to re-sign everything with one key
