//
//  DeviceHelper.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit
class DeviceHelper{
    
    static func isIpad ()-> Bool{
        return  UIDevice.current.userInterfaceIdiom == .pad ? true : false
    }
  
    static func isEnglish ()->Bool{
        return   NSLocale.current.languageCode?.contains("en") ?? false
    }
}
