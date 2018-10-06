//
//  GetFilesTasks.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import Foundation
class GetFilesTasks: BuyMieOperation {
    typealias Output = [FileModel]
    private let folderId: Int
    init(folderId: Int) {
        self.folderId = folderId
    }
    
    var request: BuyMieRequest {
        return FolderRequest.getFiles(folderId: folderId)
    }
    
    func execute(in dispatcher: Dispatcher,
                 taskCompletion: ((_ result:Output?)->Void)!,
                 completionError: ((_ error:Error?, _ statusCode:Int?)->Void)!){
        
        dispatcher.execute(request: request,
                           completion: { (response) -> Void in
                            
                            switch response {
                            case .value(let responseDict):
                                guard let responseDict = responseDict as? [String: Any],
                                    let folderList = responseDict["result"] as? [[String: Any]]  else {
                                        completionError(NetworkErrors.networkMessage(error_: "", message: "Can't rate order"), 200)
                                        return
                                }
                                
                                let files = folderList.compactMap({FileModel(with: $0)})
                                taskCompletion(files)
                                
                            case .error(let statuseCode, let error):
                                let erorrMessage = error?.localizedDescription ?? ""
                                completionError(NetworkErrors.networkMessage(error_: erorrMessage, message: erorrMessage), statuseCode)
                                
                            }
        })
    }
}
