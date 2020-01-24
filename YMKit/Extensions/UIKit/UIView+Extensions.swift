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

// MARK: - Auto Layout

extension UIView {
    
    
    /// Returns an array of constraints which, once activated, pin the view to its superview's sides with optional insets.
    ///
    /// + This method throws `YMLayoutError.superviewNotFound` if no superview is found.
    /// + Note that this method does not set `translatesAutoresizingMaskIntoConstraints` on the view
    /// to `false`; you have to do it manually.
    ///
    /// - Parameter edgeInsets: *Optional.* The insets to add between the view and its superview.
    /// Default is `.zero`.
    @available(iOS 9, *)
    public func constraintsToSuperview(
        with edgeInsets: UIEdgeInsets = .zero
    ) throws -> [NSLayoutConstraint] {
        guard let superview = self.superview else {
            throw YMLayoutError.superviewNotFound
        }
        
        return [
            self.topAnchor.constraint(
                equalTo: superview.topAnchor,
                constant: edgeInsets.top
            ),
            self.bottomAnchor.constraint(
                equalTo: superview.bottomAnchor,
                constant: -edgeInsets.bottom
            ),
            self.leftAnchor.constraint(
                equalTo: superview.leftAnchor,
                constant: edgeInsets.left
            ),
            self.rightAnchor.constraint(
                equalTo: superview.rightAnchor,
                constant: -edgeInsets.right
            ),
        ]
    }
    
    /// Pins the view to its superview's sides with optional insets.
    ///
    /// + This method throws `YMLayoutError.superviewNotFound` if no superview is found.
    ///
    /// - Parameter edgeInsets: *Optional.* The insets to add between the view and its superview.
    /// Default is `.zero`.
    @available(iOS 9, *)
    public func constrainToSuperview(with edgeInsets: UIEdgeInsets = .zero) throws {
        let constraintsToSuperview = try self.constraintsToSuperview(with: edgeInsets)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(constraintsToSuperview)
    }
    
    @available(iOS 9, *)
    @available(iOS, unavailable, renamed: "constrainToSuperview(with:)")
    public func constrainToSuperview(withInsets edgeInsets: UIEdgeInsets = .zero) throws {
        try constrainToSuperview(with: edgeInsets)
    }
    
}
