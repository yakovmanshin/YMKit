//
//  UIViewController+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

// MARK: - Instantiation from Storyboards

extension UIViewController {
    
    // Fallback on pre-Swift 5.1
    private static func __instantiate<T: UIViewController>(
        withStoryboardID viewControllerStoryboardID: String? = nil,
        fromStoryboardNamed storyboardName: String,
        in storyboardBundle: Bundle = .main
    ) -> T {
        let resolvedStoryboardID: String
        if let viewControllerStoryboardID = viewControllerStoryboardID {
            resolvedStoryboardID = viewControllerStoryboardID
        } else {
            resolvedStoryboardID = String(describing: T.self)
        }
        
        return UIStoryboard(
            name: storyboardName,
            bundle: storyboardBundle
        ).instantiateViewController(
            withIdentifier: resolvedStoryboardID
        ) as! T
    }
    
    /// Instantiates a view controller from a storyboard.
    ///
    /// + Make sure all string literals are valid and have no typos; otherwise the method will throw a runtime exception.
    /// + If the view controller is named after the view controller subclass (e.g. `MyViewController`), you can omit `viewControllerStoryboardID`.
    ///
    /// - Parameter viewControllerStoryboardID: *Optional.* The storyboard ID of the view controller. You can view and set this ID in Interface Builder's Identity inspector. Default is a string equal to the view controller subclass name (e.g. `MyViewController`).
    /// - Parameter storyboardName: *Required.* The name of the storyboard file.
    /// - Parameter storyboardBundle: *Optional.* The bundle the storyboard belongs to. Default is `main`.
    public static func instantiate(
        withStoryboardID viewControllerStoryboardID: String? = nil,
        fromStoryboardNamed storyboardName: String,
        in storyboardBundle: Bundle = .main
    ) -> Self {
        #if swift(>=5.1)
        let resolvedStoryboardID: String
        if let viewControllerStoryboardID = viewControllerStoryboardID {
            resolvedStoryboardID = viewControllerStoryboardID
        } else {
            resolvedStoryboardID = String(describing: Self.self)
        }
        
        return UIStoryboard(
            name: storyboardName,
            bundle: storyboardBundle
        ).instantiateViewController(
            withIdentifier: resolvedStoryboardID
        ) as! Self
        #else
        return __instantiate(
            withStoryboardID: viewControllerStoryboardID,
            fromStoryboardNamed: storyboardName,
            in: storyboardBundle
        )
        #endif
    }
    
}

extension UIViewController {
    
    fileprivate static func instantiate<T: UIViewController>(_ viewController: T.Type, from storyboardName: String) -> T {
        return UIStoryboard(name: storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: viewController)) as! T
    }
    
    /**
     Instantiate a view controller with the specified storyboard name.
     + Make sure storyboard name is correct; otherwise, runtime error will occur.
     - parameter storyboardName: Name of the storyboard that contains the view controller
    */
    @available(*, deprecated, renamed: "instantiate(fromStoryboardNamed:)")
    public class func instantiate(from storyboardName: String) -> Self {
        return UIViewController.instantiate(self, from: storyboardName)
    }
    
    /// Dismiss the current view controller.
    @inline(__always)
    @objc public func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Alerts

extension UIViewController {
    
    /// Displays an alert with one or two options.
    ///
    /// + If `primaryOptionLabelKey` or `primaryOptionAction` is not set, the alert will have only one (cancel) option.
    ///
    /// - Parameter title: *Required.* Title of the alert.
    /// - Parameter message: *Optional.* Message of the alert; default is `nil`.
    /// - Parameter cancelOptionLabel: *Optional.* Cancel option label; default is OK.
    /// - Parameter cancelOptionAction: *Optional.* Closure to execute when the cancel option is selected; default is `nil`.
    /// - Parameter primaryOptionLabel: *Optional.* Primary option label; default is `nil`.
    /// - Parameter primaryOptionStyle: *Optional.* See `UIAlertAction.Style`; default is `default`.
    /// - Parameter primaryOptionAction: *Optional.* Closure to execute when the primary option is selected; default is `nil`.
    public func displayAlert(
        titled title: String,
        saying message: String? = nil,
        cancelOptionLabel: String = "OK",
        cancelOptionAction: ((UIAlertAction) -> Void)? = nil,
        primaryOptionLabel: String? = nil,
        primaryOptionStyle: UIAlertAction.Style = .default,
        primaryOptionAction: ((UIAlertAction) -> Void)? = nil
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let cancelAlertAction = UIAlertAction(
            title: cancelOptionLabel,
            style: .cancel,
            handler: cancelOptionAction
        )
        alertController.addAction(cancelAlertAction)
        
        if
            let primaryOptionLabel = primaryOptionLabel,
            let primaryOptionAction = primaryOptionAction {
            let primaryAlertAction = UIAlertAction(
                title: primaryOptionLabel,
                style: primaryOptionStyle,
                handler: primaryOptionAction
            )
            alertController.addAction(primaryAlertAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    /// Displays an info alert with a single (OK) button.
    /// - Parameter titleKey: *Required.* Localization key for the title of the alert.
    /// - Parameter messageKey: *Optional.* Localization key for the message of the alert; default is `nil`.
    /// - Parameter postAlertAction: *Optional.* Closure to execute when the alert is dismissed; default is `nil`.
    public func displayInfoAlert(
        titled title: String,
        saying message: String? = nil,
        triggering postAlertAction: ((UIAlertAction) -> Void)? = nil
    ) {
        displayAlert(
            titled: title,
            saying: message,
            cancelOptionAction: postAlertAction
        )
    }
    
}

// MARK: - Localized Alerts

extension UIViewController {
    
    /// Displays an alert with one or two options with localized title, message, and option label keys.
    ///
    /// + If `primaryOptionLabelKey` or `primaryOptionAction` is not set, the alert will have only one (cancel) option.
    ///
    /// - Parameter titleKey: *Required.* Localization key for the title of the alert.
    /// - Parameter messageKey: *Optional.* Localization key for the message of the alert; default is `nil`.
    /// - Parameter cancelOptionLabelKey: *Optional.* Localization key for the cancel option label; default is OK (literally).
    /// - Parameter cancelOptionAction: *Optional.* Closure to execute when the cancel option is selected; default is `nil`.
    /// - Parameter primaryOptionLabelKey: *Optional.* Localization key for the primary option label; default is `nil`.
    /// - Parameter primaryOptionStyle: *Optional.* See `UIAlertAction.Style`; default is `default`.
    /// - Parameter primaryOptionAction: *Optional.* Closure to execute when the primary option is selected; default is `nil`.
    public func displayLocalizedAlert(
        titled titleKey: String,
        saying messageKey: String? = nil,
        cancelOptionLabel cancelOptionLabelKey: String = "OK",
        cancelOptionAction: ((UIAlertAction) -> Void)? = nil,
        primaryOptionLabel primaryOptionLabelKey: String? = nil,
        primaryOptionStyle: UIAlertAction.Style = .default
        , primaryOptionAction: ((UIAlertAction) -> Void)? = nil
    ) {
        let title = titleKey.localized
        let message = messageKey?.localized
        let primaryOptionLabel = primaryOptionLabelKey?.localized
        
        let cancelOptionLabel: String
        if cancelOptionLabelKey == "OK" {
            cancelOptionLabel = "OK"
        } else {
            cancelOptionLabel = cancelOptionLabelKey.localized
        }
        
        displayAlert(
            titled: title,
            saying: message,
            cancelOptionLabel: cancelOptionLabel,
            cancelOptionAction: cancelOptionAction,
            primaryOptionLabel: primaryOptionLabel,
            primaryOptionStyle: primaryOptionStyle,
            primaryOptionAction: primaryOptionAction
        )
    }
    
    /// Displays an info alert with a single (OK) button with localized title and message.
    /// - Parameter titleKey: *Required.* Localization key for the title of the alert.
    /// - Parameter messageKey: *Optional.* Localization key for the message of the alert; default is `nil`.
    /// - Parameter postAlertAction: *Optional.* Closure to execute when the alert is dismissed; default is `nil`.
    public func displayLocalizedInfoAlert(
        titled titleKey: String,
        saying messageKey: String? = nil,
        triggering postAlertAction: ((UIAlertAction) -> Void)? = nil
    ) {
        let title = titleKey.localized
        let message = messageKey?.localized
        
        displayInfoAlert(
            titled: title,
            saying: message,
            triggering: postAlertAction
        )
    }
    
}
