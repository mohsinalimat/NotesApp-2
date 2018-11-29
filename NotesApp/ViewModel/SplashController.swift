//
//  SplashController.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit
import Twinkle
class SplashController : BaseViewController{
    
    @IBOutlet var lblAppName:UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblAppName.twinkle()

        
    }
    
    
}
