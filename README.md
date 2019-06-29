# YMKit [![Build Status](https://travis-ci.com/yakovmanshin/YMKit.svg?branch=master)](https://travis-ci.com/yakovmanshin/YMKit)
**YMKit** is a collection of tools for quicker and easier development of iOS apps.

**YMKit** extends built-in types, such as `Date` or `UIColor`, with helpful additional methods, and introduces new types, such as `YMFormatter`, for advanced functionality.

## Installation
Use [CocoaPods](https://fwd2.net/cocoapods) to install **YMKit**. If you’ve never used it before, watch this detailed (and funny) [video from Google](https://fwd2.net/cocoapods-tutorial) on how to install and use CocoaPods.

To install **YMKit**, add the pod to your podfile:
```ruby
pod 'YMKit'
```

Run the following command in Terminal to install the newly-added pod:
```ruby
pod install
```

From now on, use the created/updated *workspace* (not project).

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
