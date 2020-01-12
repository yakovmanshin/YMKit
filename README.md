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

## Usage Examples

Here's a few examples of how YMKit can make your development routine just a little easier.

### Localized Strings
When you need to substitute a localizable string key with its localized value at runtime, you usually do something like that:

```swift
// Without arguments
let helloWorld = NSLocalizedString("HelloWorldKey", comment: "")

// With arguments
let greeting = String(format: NSLocalizedString("LocalizableGreetingKey", comment: ""), firstName, lastName)
```

With YMKit, it's shorter and simpler:

```swift
// Without arguments
let helloWorld = "HelloWorldKey".localized

// With arguments
let greeting = "LocalizableGreetingKey".localized(withParameters: firstName, lastName)
```

### `UIColor` from HEX

When you need to parse a HEX color string (such as `#ff4600`), things get so ugly I won't even demostrate them.

However, with YMKit, all it takes to get a `UIColor` instance is one line of code:

```swift
let myColor = UIColor(hexString: "#ff4600")
```

This single initializer works with both three- (`#fff`) and six-digit (`#aeaeae`) codes; with or without the `#` character.

### Individual RGB Channels from `UIColor`

If you've ever needed to extract just one channel from `UIColor`, then you certainly know what a mess it is, with variables used only once, in-out parameters, and so on.

YMKit will make your life easier—much easier:

```swift
let green = myColor.getRGBComponent(.green)
```

*CMYK support is coming later.*

### Number Formatting

Formatting numbers (prices, for examples) for different locales is no easy task. Fortunately, you don't have to remember formats for all countries—Foundation's `NumberFormatter` will take care of it. Unfortunately, using it quickly gets overwhelmingly verbose.

YMKit takes another, more declarative approach.

Let's say you need to display a price in euros that's formatted according to the user's locale and has up to two decimal digits. Here's how you do it with `NumberFormatter`:

```swift
let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .currency
numberFormatter.locale = .current
numberFormatter.currencyCode = currencyCode
numberFormatter.minimumIntegerDigits = 1
numberFormatter.minimumFractionDigits = 0
numberFormatter.maximumFractionDigits = 2

let priceString = numberFormatter.string(from: NSNumber(value: myItem.price))
```

And here's YMKit:

```swift
let priceString = myItem.price.getBasicPriceString(maxFractionDigits: 2, currencyCode: myItem.currencyCode)
```

Of course there's many options for further customization: "significant digits," grouping sepator, and currency symbol literal are just a few examples. If they're still not enough, you can even have a closure and set the remaining properties manually (as in the first example above): it will still be nicer to use because you don't have to worry about creating and managing lifecycle of the `NumberFormatter` object manually.

## Installation
There are multiple ways to install YMKit and keep it up to date.

### Swift Package Manager
The easiest way to add YMKit to your project is with Swift Package Manager (SPM). Xcode 11 has an SPM client built right in, so you can use the GUI. Click *File* → *Swift Packages* → *Add Package Dependency…*, paste YMKit repository URL (`https://github.com/yakovmanshin/YMKit`) into the search field, and select preferred update policy (*Up to Next Major* should be fine for most uses).

Xcode will check for newer versions that comply with the specified update policy from time to time. You can always check for updates manually: *File* → *Swift Packages* → *Update to Latest Package Versions*.

If you prefer working with the `Package.swift` file manually, or need to use YMKit as a dependency in a Swift package of your own, add the following entry to the `dependencies` array in the `Package.swift` file:

```swift
.package(url: "https://github.com/yakovmanshin/YMKit.git", from: "3.0.0")
```

Should you like to learn more about Swift packages and SPM, there's [a WWDC session](https://fwd2.net/33lDCqq) on that.

### CocoaPods
Alternatively, you can use [CocoaPods](https://fwd2.net/cocoapods) to install YMKit. If you’ve never worked with CocoaPods before, watch this detailed (and funny) [video from Google](https://fwd2.net/cocoapods-tutorial) on how to install and use the tool.

To install YMKit, add the following to your Podfile:
```ruby
pod 'YMKit', '~>3.0'
```

Run the following command in your project directory to install the newly-added pod:
```ruby
pod install
```

From now on, use the created / updated `.xcworkspace` (not `.xcodeproj`) to work on your app.

### Binary `XCFramework`
*This option will probably go away in v3.0.0.*

`XCFramework` is a binary format for framework distribution, which solves the most annoying problem of binary frameworks: architecture incompatibility. One bundle contains versions for all supported architectures: physical devices (`armv7` and `arm64`) and simulators (`i386` and `x86_64`). Learn more about binary frameworks and `XCFramework` in [this WWDC session](https://fwd2.net/32jBVIz).

On the [releases page](https://github.com/yakovmanshin/YMKit/releases), you will find binary `XCFramework` files attached to YMKit releases starting with v2.0.0. To use on of those files, just unzip it and drag the `XCFramework` bundle to the *Frameworks, Libraries, and Embedded Content* section in your target's *General* settings.

Keep in mind there's no auto-update feature for `XCFramework`s at this time. You have to repeat the steps above every time a new version is released.

## General Usage Tips
Just as with all frameworks, you need to import YMKit in files you'd like to use its methods in. You've most likely done it before: the most trivial example is UIKit. It's recommended to put all import statements at the top of your code files, but you can do it anywhere, in fact. Anyway, just add the following to your `.swift` file:

```swift
import YMKit
```

Here's a pro tip. You can activate extensions of all built-in types (such as `Date`, `UIColor`, `String`, etc.) for your entire project at once—to do it, import YMKit in `AppDelegate.swift`.

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

This hack won't work with types declared in YMKit, such as `YMFormatter`: to use them, you'll still need to import YMKit in individual code files.

## In-Depth Documentation
My ultimate goal is to cover 100% of types, properties, and methods with accurate, detailed, and extensive documentation. At the moment, the rate is near 90%.

To view documentation for a given type, property, or method, just Option-click its name, and the [likely] familiar pop-up will appear. You can browse source files as well, of course.

Thanks to [Jazzy](https://github.com/realm/jazzy), documentation for YMKit is also available on the web at [kit.ym.dev](https://kit.ym.dev/). However, it is only valid for the most recent release version.
