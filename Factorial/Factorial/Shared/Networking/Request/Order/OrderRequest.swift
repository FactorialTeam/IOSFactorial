//
//  OrderRequest.swift
//  BuyMie
//
//  Created by Mnats on 6/21/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
import Alamofire
enum OrderRequest: BuyMieRequest {
    
    case orderForRate(userID: String)
    case addOrder(addOrderRequestModel: AddOrderRequestModel)
    case getPreInvoice(orderid: String)
    case getOrderProducts(orderid: String)
    case reOrder(orderid: String)
    
    
    public var path: String {
        switch self {
        case .orderForRate(let userID):
            return "OrderApi/GetOrderForRate?userid=\(userID)"
        case .addOrder(_):
            return "OrderApi/AddNew"
        case .getPreInvoice(let orderid):
            return "consumer/GetPreInvoice?orderid=\(orderid)"
        case .getOrderProducts(let orderid):
            return "orderapi/GetOrderProducts?OrderID=\(orderid)"
        case .reOrder(let orderid):
            return "orderapi/ReOrder"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .orderForRate(_):
            return .get
        case .addOrder(_):
            return .post
        case .getPreInvoice(_):
            return .get
        case .getOrderProducts(_):
            return .get
        case .reOrder(_):
            return .post
            
        }
    }
    
    public var parameters: RequestParams {
        switch self {
        case .getPreInvoice(_):
            return .body(nil)
        case .orderForRate(_):
            return .body(nil)
        case .addOrder(let addOrderRequestModel):
            return .body(addOrderRequestModel.bodyParams)
        case .getOrderProducts(_):
            return .body(nil)
        case .reOrder(let orderId):
            let body = ["OrderID":orderId]
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
