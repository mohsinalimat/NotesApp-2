//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import Luminous
import RxSwift
class NotesViewModel {
    
    
    
    
    
    init() {
        
    }

    func geNotes(){
        
        if(Luminous.System.Network.isInternetAvailable){
           getRemotelly()
        }else {
            getLocallly()
        }
    }
    
    func getLocallly(){
        
    }
    
    func getRemotelly(){
        
    let x =    NoteDBManager.getAllNotes()
        
        
    }

}


