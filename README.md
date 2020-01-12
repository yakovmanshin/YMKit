# YMKit

![Build Status — master](https://go.ym.dev/ymkit-ci-master)
![Build Status — dev](https://go.ym.dev/ymkit-ci-dev)

**YMKit** is a collection of tools that make development of iOS apps quicker and easier.

The framework provides a set of small hacks, such as `UIColor` initialization from HEX values, string localization, date and number formatters, and more.

---

**NOTE**

YMKit v3.0.0 is currently under active development, and it introduces some breaking changes, compared to [v2.3.0](https://github.com/yakovmanshin/YMKit/releases/tag/v2.3.0), the most recent publicly released version. Don't use code from `dev` in production environments.

Also, documentation you see on this page may be irrelevant for v2.3.0. You can find the correct documentation at [kit.ym.dev](https://kit.ym.dev/).

---

## Installation
There are multiple ways to install **YMKit** and keep it up to date.

### Swift Package Manager
To install **YMKit** into your app with Swift Package Manager, use the built-in SPM client. In Xcode, click *File* → *Swift Packages* → *Add Package Dependency…*, paste **YMKit** repository URL (`https://github.com/yakovmanshin/YMKit`) into the search field, and select preferred version mode (we recommend selecting *Up to Next Major*).

If you need to use **YMKit** as a dependency in a Swift package of your own, add the following entry to the `dependencies` array in the `Package.swift` file:

```swift
.package(url: "https://github.com/yakovmanshin/YMKit.git", from: "3.0.0")
```

Should you like to learn more about Swift packages and SPM, there's [a WWDC session](https://fwd2.net/33lDCqq) on that.

### CocoaPods
Use [CocoaPods](https://fwd2.net/cocoapods) to install **YMKit**. If you’ve never worked with CocoaPods before, watch this detailed (and funny) [video from Google](https://fwd2.net/cocoapods-tutorial) on how to install and use CocoaPods.

To install **YMKit**, add the pod to your Podfile:
```ruby
pod 'YMKit', '~>3.0'
```

Run the following command in your project directory to install the newly-added pod:
```ruby
pod install
```

From now on, use the created / updated `.xcworkspace` (not `.xcodeproj`).

### Binary `XCFramework`
`XCFramework` is a binary format for framework distribution, which solves the most annoying problem of binary frameworks: architecture incompatibility. One bundle contains versions for all supported architectures: physical devices (`armv7` and `arm64`) and simulators (`i386` and `x86_64`). Learn more about binary frameworks and `XCFramework` in [this WWDC session](https://fwd2.net/32jBVIz).

On the [releases page](https://github.com/yakovmanshin/YMKit/releases), you will find binary `XCFramework` files attached to **YMKit** releases starting with v2.0.0. To use on of those files, just unzip it and drag the `XCFramework` bundle to the *Frameworks, Libraries, and Embedded Content* section in your target's *General* settings.

Keep in mind there's no auto-update feature for `XCFramework`s at this time. You have to repeat the steps above every time a new version is released.

## Usage
To use **YMKit**, you’ll need to import the framework.

To activate extensions of built-in types (such as `Date`, `UIColor`, `String`, etc.), you only need to import **YMKit** once. Open `AppDelegate.swift` in project navigator and import the framework:
```swift
// AppDelegate.swift

import UIKit

// Import YMKit here:
import YMKit

// That's it!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
// ...
```

To use new types declared in **YMKit** (such as `YMFormatter`), you’ll need to import **YMKit** in every file you want to use the types in.

## Documentation
Most variables and methods are documented in code.

For a nicer look, see [YMKit Docs](https://kit.ym.dev/).
