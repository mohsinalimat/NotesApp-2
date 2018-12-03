//
//  DatabaseManager.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import RealmSwift
class NoteDBManager{
    static let mRealm = try! Realm()
    static func addNote(note:NoteModel){
        
    }
    static func deleteNote(note:NoteModel){
        
    }
    static func getAllNotes()->Results<NoteModel> {
        let results: Results<NoteModel> =   mRealm.objects(NoteModel.self)
        return results
    }
    
  static  func addData(object: NoteModel)   {
        try! NoteDBManager.mRealm.write {
            NoteDBManager.mRealm.add(object, update: true)
            print("Added new object")
        }
    }
  static  func deleteAllFromDatabase()  {
        try!  NoteDBManager.mRealm.write {
            NoteDBManager.mRealm.deleteAll()
        }
    }
    
    static func deleteFromDb<T:Object>(object: T)   {
        try!   NoteDBManager.mRealm.write {
            NoteDBManager.mRealm.delete(object)
        }
    }
}
