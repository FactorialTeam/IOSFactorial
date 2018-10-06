//
//  FileModel.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
import SwiftyJSON
class FileModel {
    var title: String
    var folderId: Int?
    var fileId: Int?
    var questions: [Question]
    
    
    init(with dict: [String: Any]) {
        let json = JSON(dict)
        self.title = json[Keys.title].stringValue
        self.folderId = json[Keys.folderId].intValue
        self.fileId = json[Keys.fileId].intValue
        if let questionList = json[Keys.questions].arrayObject as? [[String: Any]] {
            self.questions = questionList.map{ Question(with: $0) }
        }else {
            self.questions = []
        }
    }
    
    func bodyParams(with title:String)-> [String: Any] {
        var params = [String: Any]()
        params[Keys.ParamsKeys.textId] = fileId!
        params[Keys.ParamsKeys.folder] = title
        let questionsList = questions.map{$0.bodyParams}
        params[Keys.ParamsKeys.questions] = questionsList
        return params
        
    }
}

//MARK: Keys
private struct Keys{
    static let title = "title"
    static let fileId = "id"
    static let folderId = "folderID"
    static let questions = "questions"
    struct ParamsKeys {
        static let textId = "TextId"
        static let folder = "Folder"
        static let questions = "Questions"
        
    }
}
