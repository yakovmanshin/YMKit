//
//  YMKit.swift
//  YMKit
//
//  Created by Yakov Manshin on 2/17/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

final public class YMKit {
    
    // No instances of YMKit can be initialized.
    private init() { }
    
    /// Returns the number of currently installed YMKit version.
    public class var version: String {
        return Bundle(for: YMKit.self).infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// Returns the number of the currently installed version of the main app (the one you’re embedding YMKit into).
    @available(*, unavailable, renamed: "AppInfo.version")
    public class var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// Returns the number of the currently installed build of the main app (the one you’re embedding YMKit into).
    @available(*, unavailable, renamed: "AppInfo.build")
    public class var appBuild: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
    
}

extension YMKit {
    public struct AppInfo {
        
        // No instances of AppInfo can be initialized.
        private init() { }
        
        /// Returns build number of currently installed main app (the one YMKit is embedded into).
        public static var build: String? {
            return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        }
        
        /// Returns bundle identifier of the main app.
        public static var bundleID: String? {
            return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
        }
        
        /// Returns display name (product name) of the main app.
        public static var name: String? {
            return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        }
        
        /// Returns version number of currently installed main app (the one YMKit is embedded into).
        public static var version: String? {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        }
        
    }
}

extension YMKit {
    public struct DeviceInfo {
        
        // No instances of DeviceInfo can be initialized.
        private init() { }
        
        /// Returns model name of the device.
        public static var model: String {
            return UIDevice.current.model
        }
        
        public struct OS {
            
            // No instances of OS can be initialized.
            private init() { }
            
            /// Returns name of the operating system installed on the device.
            public static var name: String {
                return UIDevice.current.systemName
            }
            
            /// Returns version of the operating system installed on the device.
            public static var version: String {
                return UIDevice.current.systemVersion
            }
            
        }
        
    }
}
