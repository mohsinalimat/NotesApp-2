//
//  UIColor+Hex.swift
//  Runner
//
//  Created by Msheikh on 10/14/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
import  UIKit
extension UIColor
{
    var hexString:NSString {
        let colorRef =  self.cgColor.components
        let r:CGFloat = colorRef![0]
        let g:CGFloat = colorRef![1]
        let b:CGFloat = colorRef![2]
        return NSString(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    }
}
