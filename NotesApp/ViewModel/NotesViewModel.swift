//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import Luminous
import Moya
import RxSwift
import RxCocoa
import RxRealm
import RealmSwift
class NotesViewModel : BaseViewModel {
    let provider = MoyaProvider<API>()
    let disposeBag = DisposeBag()
    override init() {
        
        let notes =  NoteDBManager.getAllNotes()
        
        Observable.changeset(from: notes)
            .subscribe(onNext: { results, changes in
                if let changes = changes {
                    /*     changes.deleted
                     changes.inserted
                     */
                    
                } else {
                    // it's the initial data
                    print(results)
                }
            }).disposed(by: disposeBag)
    }
    
    func geNotes(){
        if(Luminous.System.Network.isInternetAvailable){
            getRemotelly()
        }else{
            showErr(str: "No connection")
        }
    }
    
    
    func getRemotelly(){
        
        provider.rx.request(.getNotes).map(NoteModel.self).subscribe{ (result) in
            switch(result){
            case .success(let response):
                print(response)
                NoteDBManager.addNote(note: response)
            case .error(let error):
                print(error)
            }
            }.disposed(by: disposeBag)
        
    }
    
    
}


