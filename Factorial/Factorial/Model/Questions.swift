//
//  Questions.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
import SwiftyJSON
class Question {
    var text: String
    var questionId: Int?
    
    init(with dict: [String: Any]) {
        let json = JSON(dict)
        self.text = json[Keys.text].stringValue
        self.questionId = json[Keys.questionId].intValue
    }
    
    var bodyParams: [String: Any] {
        var params = [String: Any]()
        params[Keys.text] = text
        params[Keys.questionId] = questionId!
        return params
        
    }
}

//MARK: Keys
private struct Keys{
    static let text = "text"
    static let questionId = "id"
    
}
