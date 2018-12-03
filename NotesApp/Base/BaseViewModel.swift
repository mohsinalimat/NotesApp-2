//
//  BaseViewModel.swift
//  NotesApp
//
//  Created by Mahmoud on 12/2/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class BaseViewModel{
    
    let errObservable = BehaviorRelay<String>(value: "")
    let  hudObservable = BehaviorRelay<Bool>(value: true)
    func showHud(){
        self.hudObservable.accept(true)
    }
    
    func hideHud(){
        self.hudObservable.accept(false)
    }
    
    func showErr(str:String){
        self.errObservable.accept(str)
    }
    
    
}
