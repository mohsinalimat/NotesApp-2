//
//  UnderlineTextField.swift
//  NotesApp
//
//  Created by Mahmoud on 12/1/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class UnderLineTextField  : UITextField{
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
    }
    
    
    let border = CALayer()
    @IBInspectable  var underLineColor : UIColor = UIColor.clear{
        didSet {
            border.borderColor = underLineColor.cgColor
            let width = CGFloat(1.0)
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }
    
}
