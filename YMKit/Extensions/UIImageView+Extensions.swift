//
//  UIImageView+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 5/26/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

extension UIImageView {
    
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
    
    @available(*, deprecated, renamed: "init(imageName:width:height:tintColor:)")
    public convenience init(withImageNamed imageName: String, width: CGFloat? = nil, height: CGFloat? = nil, tintColor: UIColor? = nil) {
        let image = UIImage(named: imageName)
        
        self.init(image: image)
        
        if let tintColor = tintColor {
            self.tintColor = tintColor
        }
        
        self.frame = CGRect(x: 0, y: 0, width: width ?? image?.size.width ?? 0.0, height: height ?? image?.size.height ?? 0)
    }
    
    @available(*, deprecated, renamed: "init(imageName:intWidth:intHeight:tintColor:)")
    public convenience init(withImageNamed imageName: String, width: Int? = nil, height: Int? = nil, tintColor: UIColor? = nil) {
        var cgWidth: CGFloat? = nil
        var cgHeight: CGFloat? = nil
        
        if let width = width {
            cgWidth = CGFloat(integerLiteral: width)
        }
        
        if let height = height {
            cgHeight = CGFloat(integerLiteral: height)
        }
        
        self.init(withImageNamed: imageName, width: cgWidth, height: cgHeight, tintColor: tintColor)
    }
    
}
