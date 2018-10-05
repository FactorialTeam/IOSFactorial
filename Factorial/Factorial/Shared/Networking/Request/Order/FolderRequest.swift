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
    case getAllFolders
   
    
    public var path: String {
        switch self {
        case .addText(_):
            return "addText"
        case .addFolder(_):
            return "addFolder"
        case .getAllFolders:
            return "getAll"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .addText(_):
            return .post
        case .addFolder(_):
            return .post
        case .getAllFolders:
            return .get
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
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
}
