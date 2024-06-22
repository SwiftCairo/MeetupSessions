# file: $SCRIPT_FOLDER/add-keys.sh
#!/bin/sh

# Print Software Version
echo "***************************"
echo "*        Software         *"
echo "***************************"
echo "Cocoapods version is"
pods --version
echo "XCTool version is"
xctool -v

# Create custom Keychains
echo "***************************"
echo "*        Adding Keys       *"
echo "***************************"

# Create a custom keychain
security create-keychain -p travis ios-build.keychain

# Make the custom keychain default, so xcodebuild will use it for signing
security default-keychain -s ios-build.keychain

# Unlock the keychain
security unlock-keychain -p travis ios-build.keychain

# Add certificates to keychain and allow codesign to access them
security import ./AppleWWDRCA.cer -k ~/Library/Keychains/ios-build.keychain -A /usr/bin/codesign
security import ./dist.cer -k ~/Library/Keychains/ios-build.keychain -A /usr/bin/codesign
security import ./dist.p12 -k ~/Library/Keychains/ios-build.keychain -P "" -A /usr/bin/codesign

security set-key-partition-list -S apple-tool:,apple: -s -k travis ios-build.keychain

# Put the provisioning profile in place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./dist.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
