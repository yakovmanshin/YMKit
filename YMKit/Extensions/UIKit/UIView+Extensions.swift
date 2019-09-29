//
//  UIView+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 4/27/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

// MARK: - Animation

extension UIView {
    
    /// A simplified, `@autoclosure`-powered version of `UIView.animate(withDuration:animations:)`.
    ///
    /// + You don't need to use a closure—just write the code you want to animate as the first argument of the function.
    /// + Usage example: `UIView.animate(myView.alpha = 0.5)`.
    ///
    /// - Parameter animation: *Required.* The autoclosure to animate.
    /// - Parameter duration: *Optional.* The time interval; default is `1.0`.
    public static func animate(
        _ animation: @escaping @autoclosure () -> Void,
        withDuration duration: TimeInterval = 1.0
    ) {
        UIView.animate(withDuration: duration, animations: animation)
    }
    
}
