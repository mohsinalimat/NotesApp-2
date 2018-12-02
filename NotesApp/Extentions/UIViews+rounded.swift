//
//  UIViews+rounded.swift
//  NotesApp
//
//  Created by Mahmoud on 12/1/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    
    func toCircle(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func rounded(value:Double){
        self.layer.cornerRadius = CGFloat(value)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.0
        
    }
    
    
}
