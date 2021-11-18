# Virtusize Auth SDK for iOS

## Description

The Virtusize Auth SDK for iOS is a closed-source library that handles the SNS authentication process for our [Virtusize iOS Integration](https://github.com/virtusize/integration_ios).



## Requirements

- iOS 10.3+
- Xcode 12+
- Swift 5.0+



## Installation

### CocoaPods

Install using the [CocoaPods](https://cocoapods.org/) dependency manager. You can install it with the following command:

```
$ gem install cocoapods
```

To integrate Virtusize SDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.3'
use_frameworks!

target '<your-target-name>' do
pod 'VirtusizeAuth', '~> 1.0.0'
end
```

Then, run the following command:

```
$ pod repo update
$ pod install
```

### Swift Package Manager

1. In Xcode, select **File** > **Swift Packages** > **Add Package Dependency...** and enter `https://github.com/virtusize/virtusize_auth_ios.git` as the repository URL.
2. Select a minimum version of `1.0.0`
3. Click **Next**

