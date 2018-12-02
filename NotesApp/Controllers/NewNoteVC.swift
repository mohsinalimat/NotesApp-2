//
//  NewNoteVC.swift
//  NotesApp
//
//  Created by Mahmoud on 12/1/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import UIKit
import RxSwift

class NewNoteVC: BaseViewController {
    
    var callbackSubject:PublishSubject<String>?
    
    @IBOutlet weak var noteTextField: UnderLineTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNoteTapped(_ sender: Any) {
        
        
        if let note = noteTextField.text , note.count > 0 {
            
            callbackSubject?.onNext(note)
            dismiss(animated: true, completion: nil)

        }else {
            showSnackBar(msg: "Note field is empty")
            
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
