# YMKit

![Build Status — master](https://go.ym.dev/ymkit-ci-master)
![Build Status — dev](https://go.ym.dev/ymkit-ci-dev)

**YMKit** is a collection of tools for quicker and easier development of iOS apps.

**YMKit** extends built-in types, such as `Date` or `UIColor`, with helpful new methods, and introduces new types, such as `YMFormatter`, for advanced functionality.

## Installation
There are multiple ways to install **YMKit** and keep it up to date.

### CocoaPods
Use [CocoaPods](https://fwd2.net/cocoapods) to install **YMKit**. If you’ve never worked with CocoaPods before, watch this detailed (and funny) [video from Google](https://fwd2.net/cocoapods-tutorial) on how to install and use CocoaPods.

To install **YMKit**, add the pod to your Podfile:
```ruby
pod 'YMKit', '~>2.0'
```

Run the following command in your project directory to install the newly-added pod:
```ruby
pod install
```

From now on, use the created / updated *workspace* (not the project).

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
