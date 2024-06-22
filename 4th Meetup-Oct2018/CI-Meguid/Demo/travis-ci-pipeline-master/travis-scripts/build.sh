xcodebuild -workspace travis-ci-ex.xcworkspace -scheme travis-ci-ex -derivedDataPath BuildFolder/ -destination 'platform=iOS Simulator,OS=12.0,name=iPhone 7' -enableCodeCoverage YES clean build test

xcodebuild -workspace travis-ci-ex.xcworkspace -scheme travis-ci-ex -sdk iphoneos -configuration Release -derivedDataPath build/ -archivePath ArchiveFolder/travis-ci-ex.xcarchive PROVISIONING_PROFILE="dist.mobileprovision" ONLY_ACTIVE_ARCH=NO archive
