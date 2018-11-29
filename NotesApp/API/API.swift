//
//  APIManager.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import Moya
enum API{
    case getNotes
    case createNote(title:String ,order:Int , completed:Bool)
    case deleteNote(id:String)
    case updateNote
}

extension API:Moya.TargetType{
    
    public var baseURL: URL {
        return URL(string: "https://todo-backend-modern-js.herokuapp.com/todos/")!
    }
    
    public var path: String {
        switch self {
        case .getNotes:
            return ""
        case .createNote:
            return ""
        case .deleteNote(let id):
            return "\(id)"
        case .updateNote:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getNotes:
            return .get
        case .createNote:
            return .post
        case .deleteNote:
            return .delete
        case .updateNote:
            return .patch
        }
    }
    
    public var parameters:[String: Any]? {
        
    return ["parameterId": "someId"]
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Moya.Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
