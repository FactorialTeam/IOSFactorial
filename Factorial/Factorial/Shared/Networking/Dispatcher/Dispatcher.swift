//
//  Dispatcher.swift
//  BuyMie
//
//  Created by Mnats Karakhanyan on 3/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
public protocol Dispatcher {
    
    /// Configure the dispatcher with an environment
    ///
    /// - Parameter environment: environment configuration
    init(environment: Environment)
    
    
    
    /// This function execute the request and provide a Promise
    /// with the response.
    ///
    /// - Parameter request: request to execute
    /// - Returns: promise
    func execute(request: BuyMieRequest, completion: @escaping ((_ result:BuyMieResponse)->Void))
    
}
