# YMKit
**YMKit** is a collection of helpful tools for iOS app development. It extends built-in types, such as `Date` or `UIColor`, with helpful additional methods, as well as introduces new types, such as `YMFormatter` for advanced functionality.

## Install
Use [CocoaPods](https://fwd2.net/cocoapods) to install **YMKit**. If you’ve never used it before, watch this detailed (and funny) [video from Google](https://fwd2.net/cocoapods-tutorial) on how to install and use CocoaPods.

To install **YMKit**, add the pod to your podfile:
```
pod 'YMKit'
```

Run the following command to install the newly added pod:
```
pod install
```

Open the the created/updated workspace. Find `AppDelegate.swift` in project navigator and import the framework to activate extensions of built-in types (`Date`, `UIColor`, etc.):
```swift
// AppDelegate.swift

import UIKit

// Import YMKit here:
import YMKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
// ...
```

## Use
To use **YMKit**, you’ll need to import the framework 

## Documentation
Most variables and methods are documented in code. A short reference list will be added in the following weeks. 

### `YMKit`
```swift
/// Returns the number of the currently installed YMKit version.
version: String
```

### `YMFormatter`
```swift
/**
 Compose person name components into a single string with specified style.
 + Even though all parameters have default values, you’re highly advised to specify at least one name component; otherwise, you’ll get an empty string.
 - Parameters:
    - style: See `PersonNameComponentsFormatter.Style`
    - prefix: Dr., Mr., Ms., etc.
    - firstName: Johnatan
    - middleName: Maple
    - nickname: Johnny
    - lastName: Appleseed
    - suffix: Esq., Jr., Ph.D., etc.
*/
getPersonNameString(withStyle: PersonNameComponentsFormatter.Style, prefix: String?, firstName: String?, middleName: String?, nickname:String?, lastName: String?, suffix: String?) -> String
```

### Extensions of `Date`

```swift
/// Initialize `Date` values with year, month, and day (as integers).
init?(year: Int, month: Int, day: Int)
```

```swift
/// Get specified date component from a `Date` value.
getDateComponent(_: Calendar.Component) -> Int
```

```swift
/// Get an array of specified date component from a `Date` value.
getDateComponents(_: Set<Calendar.Component>) -> DateComponents
```

```swift
/// Get an array of specified date component from a `Date` value.
getDateComponents(_: [Calendar.Component]) -> DateComponents
```

```swift
/**
 Convert dates to date and time strings in selected locale and with selected date and time style.
 - Parameters:
    - locale: see `Locale`
    - dateStyle: see `DateFormatter.Style`
    - timeStyle: see `DateFormatter.Style`
*/
getDateTimeString(in: Locale, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String
```

```swift
/// Convert dates to date strings with selected date style.
getDateString(withStyle: DateFormatter.Style) -> String
```

```swift
/// Convert dates to time strings with selected time style.
getTimeString(withStyle: DateFormatter.Style) -> String
```

```swift
/// Calculate the difference between the date and now.
getDifference(in: Set<Calendar.Component>) -> DateComponents
```

```swift
/// Calculate the difference between the date and now.
getDifference(in: [Calendar.Component]) -> DateComponents
```

```swift
/// Calculate the difference between the date and now (in specified units).
getDifference(in: Calendar.Component) -> Int?
```

```swift
/// Calculate the difference between the date and now (in years).
ageInYears: Int?
```

### Extensions of `String`

```swift
/// Substitute the specified key with the corresponding localized string.
localized: String
```

```swift
/**
 Substitute the specified key with the corresponding localized string, substituting additional parameters.
 + The number and types of parameters in function call must match the number and types of parameters in the localized string, or a runtime error will occur.
*/
localized(withParameters: CVarArg...) -> String
```
