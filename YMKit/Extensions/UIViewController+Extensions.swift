//
//  UIViewController+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

// MARK: - INITIALIZATION

extension UIViewController {
    
    fileprivate static func instantiate<T: UIViewController>(_ viewController: T.Type, from storyboardName: String) -> T {
        return UIStoryboard(name: storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: viewController)) as! T
    }
    
    /**
     Instantiate a view controller with the specified storyboard name.
     + Make sure storyboard name is correct; otherwise, runtime error will occur.
     - parameter storyboardName: Name of the storyboard that contains the view controller
    */
    open class func instantiate(from storyboardName: String) -> Self {
        return UIViewController.instantiate(self, from: storyboardName)
    }
    
    /// Dismiss the current view controller.
    @inline(__always)
    @objc open func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - ALERTS

extension UIViewController {
    
    /**
     Display an alert with the specified title, message, and up to two options.
     + The primary option is displayed only when both `primaryOptionLabel` and `primaryOptionAction` are set.
     - Parameters:
        - title: Title of the alert
        - message: Message of the alert; default is `nil`
        - cancelOptionLabel: Label of the cancel option; default is “OK”
        - cancelOptionAction: Block of code to execute when the cancel option is seleected; default is `void`
        - primaryOptionLabel: Label of the primary option; default is `nil`
        - primaryOptionStyle: See `UIAlertAction.Style`; default is `default`
        - primaryOptionAction: Block of code to execute when the primary option is seleected; default is `void`
    */
    open func displayAlert(titled title: String, saying message: String? = nil, cancelOptionLabel: String = "OK", cancelOptionAction: ((UIAlertAction) -> Void)? = nil, primaryOptionLabel: String? = nil, primaryOptionStyle: UIAlertAction.Style = .default, primaryOptionAction: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAlertAction = UIAlertAction(title: cancelOptionLabel, style: .cancel, handler: cancelOptionAction)
        alertController.addAction(cancelAlertAction)
        
        if let primaryOptionLabel = primaryOptionLabel, let primaryOptionAction = primaryOptionAction {
            let primaryAlertAction = UIAlertAction(title: primaryOptionLabel, style: primaryOptionStyle, handler: primaryOptionAction)
            alertController.addAction(primaryAlertAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    /**
     Display an info alert with the specified title, message, and the OK button.
     - Parameters:
        - title: Title of the alert
        - message: Message of the alert
        - postAlertAction: Block of code to execute when the alert is dismissed; not required
     */
    open func displayInfoAlert(titled title: String, saying message: String? = nil, triggering postAlertAction: ((UIAlertAction) -> Void)? = nil) {
        displayAlert(titled: title, saying: message, cancelOptionAction: postAlertAction)
    }
    
}
