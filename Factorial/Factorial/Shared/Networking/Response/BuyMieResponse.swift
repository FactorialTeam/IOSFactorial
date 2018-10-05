//
//  BuyMieResponse.swift
//  BuyMie
//
//  Created by Mnats on 6/11/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
public enum BuyMieResponse {
    case value(_: AnyObject?)
    case error(_: Int?, _: Error?)
    
    init(_ response: (isSuccess:Bool, value:AnyObject? ,r: HTTPURLResponse?, data: Data?, error: Error?), for request: BuyMieRequest) {
//        print(request.path)
//        let datastring = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
//        print("response.data ---  \(datastring ?? "")")
//        print("response ---  \(String(describing: response.r))")
//        print("response.result.error ---  \(String(describing: response.error))")
        if let stausCode = response.r?.statusCode, stausCode == 401  {
            NotificationCenter.default.post(name: Notification.Name("AutirizationFailedNotofication"), object: nil)
            self = .value(nil)
            return
        }
        if response.isSuccess {
//            print("response.value  --- \(response.value)")
            if let errorDict  = response.value as? [String : AnyObject], let erroreMessage = errorDict["Error"] as? String {
                self = .error(response.r?.statusCode, NetworkErrors.networkMessage(error_: "", message: erroreMessage))
                return
            }
            self = .value(response.value)
        } else {
            guard let _ = response.data else {
                self = .error(response.r?.statusCode, NetworkErrors.noData)
                return
            }
            self = .value("" as AnyObject)
        }
    }
}
