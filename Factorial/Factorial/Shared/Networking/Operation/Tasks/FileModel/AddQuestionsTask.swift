//
//  AddQuestionsTask.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
class AddQuestionsTask: BuyMieOperation {
    typealias Output = Bool
    private let file: FileModel
    private let title: String
    init(file: FileModel, title:String) {
        self.file = file
        self.title = title
    }
    
    var request: BuyMieRequest {
        return FolderRequest.addQuestions(file: file, title: title)
    }
    
    func execute(in dispatcher: Dispatcher,
                 taskCompletion: ((_ result:Output?)->Void)!,
                 completionError: ((_ error:Error?, _ statusCode:Int?)->Void)!){
        
        dispatcher.execute(request: request,
                           completion: { (response) -> Void in
                            
                            switch response {
                            case .value(let responseDict):
                                guard let responseDict = responseDict as? [String: Any],
                                    let fileDict = responseDict["success"] as? Int  else {
                                        completionError(NetworkErrors.networkMessage(error_: "", message: "Can't rate order"), 200)
                                        return
                                }
                                
                                taskCompletion(true)
                                
                            case .error(let statuseCode, let error):
                                let erorrMessage = error?.localizedDescription ?? ""
                                completionError(NetworkErrors.networkMessage(error_: erorrMessage, message: erorrMessage), statuseCode)
                                
                            }
        })
    }
}
