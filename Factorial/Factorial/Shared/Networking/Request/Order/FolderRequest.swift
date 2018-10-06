//
//  FolderRequest.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
import Alamofire
enum FolderRequest: BuyMieRequest {
    
    case addText(text: String)
    case addFolder(title: String)
    case getFiles(folderId: Int)
    case addQuestions(file: FileModel, title: String)
    case getAllFolders
   
    
    public var path: String {
        switch self {
        case .addText(_):
            return "addText"
        case .addFolder(_):
            return "addFolder"
        case .getFiles(_):
            return "getByFolder"
        case .getAllFolders:
            return "getAll"
        case .addQuestions(_,_):
            return "addQuestions"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .addText(_):
            return .post
        case .addFolder(_):
            return .post
        case .getFiles(_):
            return .post
        case .getAllFolders:
            return .get
        case .addQuestions(_,_):
            return .post
        }
    }
    
    public var parameters: RequestParams {
        switch self {
        case .addText(let text):
            let body = ["TextContent": text]
            return .body(body)
        case .addFolder(let title):
            let body = ["Title": title]
            return .body(body)
        case .getAllFolders:
            return .body(nil)
        case .getFiles(let folderId):
            let body = ["folderID": folderId]
            return .body(body)
        case .addQuestions(let file, let title):
            let body = file.bodyParams(with: title)
            return .body(body)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
}
