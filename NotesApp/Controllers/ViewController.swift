//
//  ViewController.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import UIKit
import PopItUp
import RxSwift
class ViewController: UIViewController {
    let addNoteSubject = PublishSubject<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addNoteTapped(_ sender: Any) {
        showNewNotePopUp()
    }
    
    func  showNewNotePopUp(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "addNoteVC") as! NewNoteVC
        vc.callbackSubject = self.addNoteSubject
            
            presentPopup(vc,
                         animated: true,
                         backgroundStyle: .blur(.dark),
                         constraints: [.width(300),.height(130)],
                         transitioning: .slide(.bottom),
                         autoDismiss: true,
                         completion: nil)
    }
    
    
    
    
}

