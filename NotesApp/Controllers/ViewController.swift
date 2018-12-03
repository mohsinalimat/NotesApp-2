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
import PopMenu
import RxCocoa
import RxRealm
import RxRealmDataSources
class ViewController: BaseViewController {
    let disposeBag = DisposeBag()
    let viewmodel = NotesViewModel()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObservers()
        viewmodel.geNotes()
    }
    
    @IBAction func addNoteTapped(_ sender: Any) {
        showNewNotePopUp(type:.addVC,note: nil)
    }
    
    func  showNewNotePopUp(type:VCType,note:NoteModel?){
        let vc = storyboard?.instantiateViewController(withIdentifier: "addNoteVC") as! NewNoteVC
        vc.note = note
        presentPopup(vc,
                     animated: true,
                     backgroundStyle: .blur(.dark),
                     constraints: [.width(300),.height(130)],
                     transitioning: .slide(.bottom),
                     autoDismiss: true,
                     completion: nil)
        
        
    }
    
    
    func  presentCellMenu(noteModel:NoteModel){
        let action1 = PopMenuDefaultAction(title: "Edit", didSelect: { action in
            self.showNewNotePopUp(type: .editVC, note: noteModel)
        })
        let action2 = PopMenuDefaultAction(title: "Delete", didSelect: { action in
           NoteDBManager.deleteNote(note: noteModel)
            
        })
        
        let menu = PopMenuViewController(actions: [action1,action2])
        menu.appearance.popMenuBackgroundStyle = .blurred(.dark)
        menu.appearance.popMenuActionHeight = 30.0
        menu.appearance.popMenuCornerRadius = 0.0
        menu.appearance.popMenuItemSeparator = .fill(.black, height: 1.0)
        
        present(menu, animated: true, completion: nil)
        
    }
    
    func initObservers(){
        
        viewmodel.errObservable.subscribe { (event) in
            self.showSnackBar(event.element!)
            }.disposed(by: self.disposeBag)
        
        viewmodel.hudObservable.subscribe { (event) in
            if(event.element)!{
                self.showLoadingDialog()
            }else{
                self.hideLoadingDialog()
            }
            }.disposed(by: self.disposeBag)
        
        
        let datasource = RxTableViewRealmDataSource<NoteModel>(
        cellIdentifier: "noteCell", cellType: NoteTableViewCell.self) {cell, ip, item in
            cell.note = item
            cell.btnActions.rx.tap.bind{
                self.presentCellMenu(noteModel: item)
                }.disposed(by: self.disposeBag)
        }
        Observable.changeset(from:  NoteDBManager.getAllNotes()).bind(to: tableview.rx.realmChanges(datasource))
            .disposed(by:self.disposeBag)
        
       
    }
}


