//
//  GetOrderProductsTask.swift
//  BuyMie
//
//  Created by Mnats on 8/30/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
class GetOrderProductsTask: BuyMieOperation {
    typealias Output = [String: Any]
    private let orderId: String
    
    init(orderId: String) {
        self.orderId = orderId
    }
    
    var request: BuyMieRequest {
        return OrderRequest.getOrderProducts(orderid: orderId)
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
                                        completionError(NetworkErrors.networkMessage(error_: "", message: "Can't load order products"), 200)
                                        return
                                }
                                if message != "success" {
                                    completionError(NetworkErrors.networkMessage(error_: "", message: message), 200)
                                }else {
                                    if let order = responseDict["order"] as? [String: Any] {
                                        taskCompletion(order)
                                    }else {
                                        completionError(NetworkErrors.networkMessage(error_: "", message: message), 200)
                                    }
                                }
                            case .error(let statuseCode, let error):
                                let erorrMessage = error?.localizedDescription ?? ""
                                completionError(NetworkErrors.networkMessage(error_: erorrMessage, message: erorrMessage), statuseCode)
                                
                            }
        })
    }
}
