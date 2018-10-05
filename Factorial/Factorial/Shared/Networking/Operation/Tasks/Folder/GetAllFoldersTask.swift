//
//  GetAllFoldersTask.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
class GetAllFoldersTask: BuyMieOperation {
    typealias Output = [FolderModel]
    
    init() {
    }
    
    var request: BuyMieRequest {
        return FolderRequest.getAllFolders
    }
    
    func execute(in dispatcher: Dispatcher,
                 taskCompletion: ((_ result:Output?)->Void)!,
                 completionError: ((_ error:Error?, _ statusCode:Int?)->Void)!){
        
        dispatcher.execute(request: request,
                           completion: { (response) -> Void in
                            
                            switch response {
                            case .value(let responseDict):
                                guard let responseDict = responseDict as? [String: Any],
                                    let message = responseDict["message"] as? String  else {
                                        completionError(NetworkErrors.networkMessage(error_: "", message: "Can't rate order"), 200)
                                        return
                                }
                                if message != "success" {
                                    completionError(NetworkErrors.networkMessage(error_: "", message: message), 200)
                                }else {
                                    guard let storeDictList = responseDict["stores"] as? [[String: Any]] else {
                                        completionError(NetworkErrors.networkMessage(error_: "", message: "Can't load stores"), 200)
                                        return
                                    }
                                    if storeDictList.count == 0 {
                                        completionError(NetworkErrors.noData,0)
                                        return
                                    }
                                    
                                    let folders = storeDictList.compactMap({FolderModel(with: $0)})
                                    taskCompletion(folders)
                                }
                                
                            case .error(let statuseCode, let error):
                                let erorrMessage = error?.localizedDescription ?? ""
                                completionError(NetworkErrors.networkMessage(error_: erorrMessage, message: erorrMessage), statuseCode)
                                
                            }
        })
    }
}
