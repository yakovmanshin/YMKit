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
    
    /// Returns the number of the currently installed YMKit version.
    public class var version: String {
        return Bundle(for: YMKit.self).infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// Returns the number of the currently installed version of the main app (the one you’re embedding YMKit into).
    public class var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// Returns the number of the currently installed build of the main app (the one you’re embedding YMKit into).
    public class var appBuild: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
    
}
