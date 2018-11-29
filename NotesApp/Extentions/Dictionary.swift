//
//  Dictionary.swift
//  Runner
//
//  Created by Msheikh on 10/18/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation

extension Dictionary {
    
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(json)
    }
    
}
