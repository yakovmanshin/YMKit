//
//  AppInfo.swift
//  YMKit
//
//  Created by Yakov Manshin on 3/10/21.
//  Copyright © 2021 Yakov Manshin. See the LICENSE file for license info.
//

import Foundation

/// The object that provides information about the host app.
final public class AppInfo {
    
    public static let `default` = AppInfo(bundle: .main)
    
    private let bundle: Bundle
    
    public init(bundle: Bundle) {
        self.bundle = bundle
    }
    
}

public extension AppInfo {
    
    /// Returns the display name (product name) of the host app.
    var name: String? {
        bundle.infoDictionary?["CFBundleDisplayName"] as? String
    }
    
    /// Returns the bundle identifier of the host app.
    var bundleID: String? {
        bundle.infoDictionary?["CFBundleIdentifier"] as? String
    }
    
    /// Returns the version number of the host app.
    var version: String? {
        bundle.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Returns the build number of the host app.
    var build: String? {
        bundle.infoDictionary?["CFBundleVersion"] as? String
    }
    
}
