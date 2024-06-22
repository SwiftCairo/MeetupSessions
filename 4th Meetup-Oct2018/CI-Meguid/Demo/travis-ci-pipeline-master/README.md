# Travis CI Pipeline for iOS
[![Build Status](https://travis-ci.org/meguid/Travis-CI-Pipeline.svg?branch=master)](https://travis-ci.org/meguid/Travis-CI-Pipeline)

Building a Continues Integration pipeline using Travis CI for iOS Applications.

## Requirements
- [x] A [GitHub](https://github.com) account.
- [x] Owner permissions for a project [hosted on GitHub](https://help.github.com/categories/importing-your-projects-to-github).

## Steps:

- [x] Go to Travis and [Sign up with GitHub](https://travis-ci.com/signin)
- [x] Accept the Authorization of Travis CI. You’ll be redirected to GitHub.
- [x] Click the green Activate button, and select the repositories you want to use with Travis CI.

- [x] Add a **`.travis.yml`**  file to your repository to tell Travis CI what to do. 

  ```bash
  language: swift
  osx_image: xcode10  
  script:
  - xcodebuild -workspace WORKSPACEPATH -scheme SCHEME -derivedDataPath BUILDPATH -destination 'platform=iOS Simulator,OS=12.0,name=iPhone 7' -enableCodeCoverage YES clean build test
  ```
- [x] Add the **`.travis.yml`** file to git, commit and push, to trigger a Travis CI build.
- [x] Check the build status page to see if your build passes or fails.
- [x] YOU MADE IT!! You have built your first baby CI Pipeline.

#### Notes:
- Replace **`WORKSPACEPATH`**, **`SCHEME`** and **`BUILDPATH`** with your values.
- It's better to set **`osx_image`** to the same xcode version installed on your local machine for compatibility.
- I prefer to set custom **`derivedDataPath`** so I can access it later for getting coverage percentage.
- Set simulator **`OS`** version mathcing with your **`osx_image`** value (for example xcode10 and 12.0)
- You can change **`Swift`** to **`objective-c`**.

## Running your Tests and break the build in case of failure in Tests:

- [x] Open up the Manage Schemes sheet by selecting the Product → Schemes → Manage Schemes… menu option.
- [x] Locate the target you want to use for testing in the list. 
- [x] Ensure that the Shared checkbox in the far right hand column of the sheet is checked.
- [x] If your target include cross-project dependencies such as CocoaPods, then you will need to ensure that they have been configured as explicit dependencies. 

     To do so:
     - Highlight your application target and hit the Edit… button to open the Scheme editing sheet.
     - Click the Build tab in the left-hand panel of the Scheme editor.
     - Click the + button and add each dependency to the project. CocoaPods will appear as a static library named Pods.
     - Drag the dependency above your test target so it is built first.

- [x] You will now have a new file in the xcshareddata/xcschemes directory underneath your Xcode project. This is the shared Scheme that you just configured. Check this file into your repository and xcodebuild will be able to find and execute your tests.
- [x] YES!! Now with every git commit Travis will run yout tests and break the build if any test case fails.

## Running Static Code Analysis Tool (SwiftLint) and break the build in case of failure:

- [x] Add install command to **`.travis.yml`** file to install Swiftlint.
  ```bash
  language: swift
  osx_image: xcode10  
  
  install:
  - ./install_swiftlint.sh

  script:
  - xcodebuild -workspace WORKSPACEPATH -scheme SCHEME -derivedDataPath BUILDPATH -destination 'platform=iOS Simulator,OS=12.0,name=iPhone 7' -enableCodeCoverage YES clean build test
  ```

- [x] Add a [Swiftlint YML file](https://github.com/realm/SwiftLint/blob/master/.swiftlint.yml) **`.swiftlint.yml`** to your project folder if you want to configure custom rules for swiftlint.

- [x] Add script command in **`.travis.yml`** file to run swiftlint, but install your pods before.
  ```bash
  language: swift
  osx_image: xcode10  
  
  install:
  - ./install_swiftlint.sh

  script:
  - pod install
  - swiftlint
  - xcodebuild -workspace WORKSPACEPATH -scheme SCHEME -derivedDataPath BUILDPATH -destination 'platform=iOS Simulator,OS=12.0,name=iPhone 7' -enableCodeCoverage YES clean build test
  ```
- [x] DONE! Now your build will fail in case there's errors in swiftlint.

## Gather code coverage data and break the build with given threshold

- [x] Enable "Gather coverage data" in your test scheme.
- [x] Create a new bash script **`validateCoverage.sh`**
- [x] Use xccov to generate coverage reports, then we convert it to json (Read more about xccov)
  ```bash
  xcrun xccov view Build/Logs/Test/*.xcresult/3_Test/action.xccovreport --json > coverage.json
  ```
- [x] Parse the coverage using **`Parser.swift`** 
  ```bash
  coverage=`swift Parser.swift coverage.json`
  ```
- [x] Then fail (exit with non 0 code) if coverage is less than 70%
  ```bash
  xcrun xccov view Build/Logs/Test/*.xcresult/3_Test/action.xccovreport --json > coverage.json
  coverage=`swift Parser.swift coverage.json`
  echo $coverage
  if [ $coverage -lt 70 ];
  then
  exit 1
  else
  exit 0
  fi
  ```
- [x] Run  **`validateCoverage.sh`** from  **`.travis.yml`** file (bash validateCoverage.sh)
  ```bash
  language: swift
  osx_image: xcode10

  install:
  - ./install_swiftlint.sh

  script:
  - pod install
  - swiftlint
  - xcodebuild -workspace travis-ci-ex.xcworkspace -scheme travis-ci-ex -derivedDataPath Build/ -destination 'platform=iOS Simulator,OS=12.0,name=iPhone 7' -enableCodeCoverage YES clean build test
  - bash validateCoverage.sh
  ```
- [x] DONE ;) Now with every git commit Travis will fetch the coverage from xcode and fail when coverage is less than 70%

## Certificates Signing, archive, generate IPA and upload to hockyapp.
```bash
  - bash decryptCertificates.sh
  - bash add-keys.sh
  - bash update-bundle.sh  
  
  - xcodebuild -workspace travis-ci-ex.xcworkspace -scheme travis-ci-ex -sdk iphoneos -configuration Release -derivedDataPath build/ -archivePath ArchiveFolder/travis-ci-ex.xcarchive PROVISIONING_PROFILE="dist.mobileprovision" ONLY_ACTIVE_ARCH=NO archive

  - bash delete-keys.sh
  - bash generateIPA.sh
  - bash ipa-upload.sh
  ```

