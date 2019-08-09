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
    /// - Parameter imageName: *Required.* Image name to initialize an image view with. If an image with the specified name doesn't exist, the initializer fails and returns `nil`.
    /// - Parameter frame: *Required.* `CGRect` to draw the image view in.
    /// - Parameter tintColor: *Optional.* Tint color to use with the image.
    public convenience init?(withImageNamed imageName: String, in frame: CGRect, tinted tintColor: UIColor? = nil) {
        guard let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate) else { return nil }
        
        self.init(frame: frame)
        
        self.image = image
        self.tintColor = tintColor
    }
    
    /**
     Initialize `UIImageView` with the name of the images and, optionally, its dimensions and tint color.
     - Parameters:
        - imageName: The name of the image stored in an `.xcassets` file
        - width: Width of the image in the initialized `UIImageView`
        - height: Height of the image in the initialized `UIImageView`
        - tintColor: Tint color of the image in the initialized `UIImageView`
    */
    public convenience init(imageName: String, width: CGFloat? = nil, height: CGFloat? = nil, tintColor: UIColor? = nil) {
        let image = UIImage(named: imageName)
        
        self.init(image: image)
        
        if let tintColor = tintColor {
            self.tintColor = tintColor
        }
        
        self.frame = CGRect(x: 0, y: 0, width: width ?? image?.size.width ?? 0.0, height: height ?? image?.size.height ?? 0)
    }
    
    /**
     Initialize `UIImageView` with the name of the images and, optionally, its dimensions and tint color.
     - Parameters:
        - imageName: The name of the image stored in an `.xcassets` file
        - width: Width of the image in the initialized `UIImageView`
        - height: Height of the image in the initialized `UIImageView`
        - tintColor: Tint color of the image in the initialized `UIImageView`
    */
    public convenience init(imageName: String, intWidth: Int? = nil, intHeight: Int? = nil, tintColor: UIColor? = nil) {
        var cgWidth: CGFloat? = nil
        var cgHeight: CGFloat? = nil
        
        if let intWidth = intWidth {
            cgWidth = CGFloat(integerLiteral: intWidth)
        }
        
        if let intHeight = intHeight {
            cgHeight = CGFloat(integerLiteral: intHeight)
        }
        
        self.init(imageName: imageName, width: cgWidth, height: cgHeight, tintColor: tintColor)
    }
    
}
