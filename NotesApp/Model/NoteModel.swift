//
//  NoteModel.swift
//  NotesApp
//
//  Created by Mahmoud on 12/1/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import RealmSwift

class NoteModel : Object,Codable {
    @objc dynamic var completed : Bool = false
    @objc dynamic var  title : String?
    @objc dynamic var order : Int = 0
    @objc dynamic var url : String?
    @objc dynamic var id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case completed = "completed"
        case title = "title"
        case order = "order"
        case url = "url"
        case id = "id"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience  init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed) ?? false
        title = try values.decodeIfPresent(String.self, forKey: .title)
        order = try values.decodeIfPresent(Int.self, forKey: .order) ?? 0
        url = try values.decodeIfPresent(String.self, forKey: .url)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}
