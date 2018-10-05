//
//  AddOrderTask.swift
//  BuyMie
//
//  Created by Mnats on 8/18/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
class AddOrderTask: BuyMieOperation {
    typealias Output = Int
    private var addOrderRequestModel: AddOrderRequestModel
    
    init(addOrderRequestModel: AddOrderRequestModel) {
        self.addOrderRequestModel = addOrderRequestModel
    }
    
    var request: BuyMieRequest {
        return OrderRequest.addOrder(addOrderRequestModel: addOrderRequestModel)
    }
    
    func execute(in dispatcher: Dispatcher,
                 taskCompletion: ((_ result:Output?)->Void)!,
                 completionError: ((_ error:Error?, _ statusCode:Int?)->Void)!){
        
        dispatcher.execute(request: request,
                           completion: { [weak weakAddOrderRequestModel = self.addOrderRequestModel] (response) -> Void in
                            
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
                                    if let orderId = responseDict["ID"] as? Int{
                                        if let strongAddOrderRequestModel = weakAddOrderRequestModel {
                                            let price = Double(strongAddOrderRequestModel.subTotal)
                                             EventLoger.shared.logStartCheckoutWithPrice(price, currency: AppCurrency.eur, itemCount: strongAddOrderRequestModel.logItemsCount, storeName: strongAddOrderRequestModel.logStore, delyvaryFee: strongAddOrderRequestModel.deliveryFee)
                                        }
                                      
                                        taskCompletion(orderId)
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
