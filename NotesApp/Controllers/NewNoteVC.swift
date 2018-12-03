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
    //Mark-: vars
    var type:VCType = .addVC
    var note:NoteModel?
    var viewModel:NotesViewModel?
    
    //Mark Outlets
    @IBOutlet weak var btnSubmit: RoundedButton!
    @IBOutlet weak var noteTextField: UnderLineTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch type {
        case .addVC:
            self.btnSubmit.setTitle("add", for: UIControlState.normal)
            break
        case .editVC:
            noteTextField.text = note?.title ?? ""
            self.btnSubmit.setTitle("edit", for: UIControlState.normal)
            break
        }
        
        
    }
    
    @IBAction func addNoteTapped(_ sender: Any) {
        if let cnote = noteTextField.text , cnote.count > 0 {
            guard let mynote = note else{
                return
            }
            mynote.title = cnote
            NoteDBManager.addNote(note: mynote)
            dismiss(animated: true, completion: nil)
        }else {
            viewModel?.showErr(str: "Note field is empty")
        }
    }
}
enum VCType {
    case addVC
    case editVC
}
