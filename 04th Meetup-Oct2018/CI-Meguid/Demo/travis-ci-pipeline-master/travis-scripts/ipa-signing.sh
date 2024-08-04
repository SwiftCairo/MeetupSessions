PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/dist.mobileprovision"
OUTPUTDIR="$PROJECT_DIRECTORY/"

echo "***************************"
echo "*        Signing          *"
echo "***************************"
xcodebuild -exportArchive -archivePath ArchiveFolder/travis-ci-ex.xcarchive -exportOptionsPlist "ExportOptions.plist" -exportPath "$OUTPUTDIR" -allowProvisioningUpdates
