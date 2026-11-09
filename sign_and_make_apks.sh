#!/usr/bin/env bash
# Re-sign base.apk + all splits with ONE key and bundle them (needs Android build-tools: apksigner, and Java).
# Usage: ./sign_and_make_apks.sh
set -e
cd "$(dirname "$0")"
KS=my.keystore
[ -f $KS ] || keytool -genkeypair -keystore $KS -storepass android -keypass android -alias key -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Ludo Green Mod"
mkdir -p signed
for f in apks/base.apk apks/split_config.*.apk; do
  name=$(basename "$f")
  apksigner sign --ks $KS --ks-pass pass:android --key-pass pass:android --out signed/$name $f
done
(cd signed && zip -q ../Ludo_Classic_green.apks *.apk)
echo "Done: Ludo_Classic_green.apks  (install with SAI app, or: adb install-multiple signed/*.apk)"
echo "Uninstall the original Ludo Classic first (signature differs)."
