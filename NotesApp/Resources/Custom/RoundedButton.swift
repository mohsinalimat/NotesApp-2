//
//  RoundedButton.swift
//  NotesApp
//
//  Created by Mahmoud on 12/1/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class RoundedButton : UIButton{
    
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
    }
    
    @IBInspectable var cornerRadius:Double  = 0.0 {
        didSet{
            self.rounded(value: cornerRadius)
        }
    }
    
    @IBInspectable var isCircle:Bool = false {
        
        didSet{
            if(isCircle){
                self.toCircle()
            }
        }
    }
    
    
}
