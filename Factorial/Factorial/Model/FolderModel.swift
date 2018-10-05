//
//  FolderModel.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
import SwiftyJSON
class FolderModel {
    var folderName: String
    var folderId: Int?

    init(with dict: [String: Any]) {
        let json = JSON(dict)
        self.folderName = json[Keys.folderName].stringValue
        self.folderId = json[Keys.folderId].intValue
    }
}

//MARK: Keys
private struct Keys{
    static let folderName = "title"
    static let folderId = "id"

}
