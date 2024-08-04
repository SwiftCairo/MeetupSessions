# file: $SCRIPT_FOLDER/update-bundle.sh
#!/bin/sh

# Updating Plist Information for deployment
echo "***************************"
echo "*    Updating Bundle      *"
echo "***************************"

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $TRAVIS_BUILD_NUMBER" "$INFO_PLIST"
echo "Set CFBundleVersion to $TRAVIS_BUILD_NUMBER"
