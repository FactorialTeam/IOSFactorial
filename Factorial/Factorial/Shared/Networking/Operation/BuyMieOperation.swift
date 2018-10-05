//
//  BuyMieOperation.swift
//  BuyMie
//
//  Created by Mnats on 6/11/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
protocol BuyMieOperation {
    associatedtype Output
    
    /// Request to execute
    var request: BuyMieRequest { get }
    
    /// Execute request in passed dispatcher
    ///
    /// - Parameter dispatcher: dispatcher
    /// - Returns: a promise
    func execute(in dispatcher: Dispatcher, taskCompletion: ((_ result:Output?)->Void)!,completionError: ((_ error:Error?, _ statusCode:Int?)->Void)!)
    
}
