//
//  UIImageView+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 5/26/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Initialize a `UIImageView` with image name, target frame, and, optinally, tint color.
    ///
    /// - Parameter imageName: *Required.* Image name to initialize an image view with. If an image with the specified name doesn't exist, the initializer fails and returns `nil`.
    /// - Parameter frame: *Required.* `CGRect` to draw the image view in.
    /// - Parameter tintColor: *Optional.* Tint color to use with the image.
    public convenience init?(
        withImageNamed imageName: String,
        in frame: CGRect,
        tinted tintColor: UIColor? = nil
    ) {
        guard let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate) else { return nil }
        
        self.init(frame: frame)
        
        self.image = image
        self.tintColor = tintColor
    }
    
    /// Initializes a `UIImageView` with the image retrieved by its name, and, optionally, the image's dimensions and tint color.
    ///
    /// - Parameter imageName: *Required.* The name of the image. Must be a valid name; otherwise, the method will return `nil`.
    /// - Parameter width: *Optional.* The width of the image in the `UIImageView`; defaults to the image's width.
    /// - Parameter height: *Optional.* The height of the image in the `UIImageView`; defaults to the image's height.
    /// - Parameter tintColor: *Optional.* The tint color of the image in the `UIImageView`.
    public convenience init?(
        withImageNamed imageName: String,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        tintColor: UIColor? = nil
    ) {
        guard let image = UIImage(named: imageName) else { return nil }
        
        let size = CGSize(
            width: width ?? image.size.width,
            height: height ?? image.size.height
        )
        
        self.init(frame: CGRect(origin: .zero, size: size))
        
        if let tintColor = tintColor {
            self.tintColor = tintColor
        }
    }
    
}
