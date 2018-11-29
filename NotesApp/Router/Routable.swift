//
//  Routable.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit

protocol Routable {
    
}

extension Routable where Self: UIViewController {
    
    
    func startController<T: UIViewController>(storyboard: UIStoryboard,prsentation: Presentation? = .push,identifier: String? = nil, animated: Bool = true, modalPresentationStyle: UIModalPresentationStyle? = nil, configure: ((T) -> Void)? = nil, completion: ((T) -> Void)? = nil) {
        
        guard let controller = (identifier != nil
            ? storyboard.instantiateViewController(withIdentifier: identifier!)
            : storyboard.instantiateInitialViewController()) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        if let modalPresentationStyle = modalPresentationStyle {
            controller.modalPresentationStyle = modalPresentationStyle
        }
        
        configure?(controller)
        
        if(prsentation == .push ){
            present(controller, animated: animated) {
                completion?(controller)
            }
        }else {
            self.navigationController?.pushViewController(controller, animated: animated)
            
        }
    }
    
    
}
enum Presentation{
    case present
    case push
}
