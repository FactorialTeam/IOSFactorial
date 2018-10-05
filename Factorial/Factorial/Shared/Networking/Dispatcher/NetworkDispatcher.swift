//
//  NetworkDispatcher.swift
//  BuyMie
//
//  Created by Mnats Karakhanyan on 3/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkErrors: Error {
    case badInput
    case noData
    case networkMessage(error_:String, message:String)
}
public class NetworkDispatcher: Dispatcher {
    static func defaultDispatcher() -> NetworkDispatcher{
      return NetworkDispatcher(environment: Environment.defaultEnvironment())
    }
    static func autDispatcher() -> NetworkDispatcher{
        return NetworkDispatcher(environment: Environment.autEnvironment())
    }
    private var environment: Environment
    private var session: URLSession
    required public init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
   public func execute(request: BuyMieRequest, completion: @escaping ((_ result:BuyMieResponse)->Void)){
        let rq =  self.prepareURLRequest(for: request)
        rq.responseJSON { response in
            print(response)
            let buyMieResponse  = BuyMieResponse((isSuccess: response.result.isSuccess, value: response.result.value as AnyObject?, r: response.response, data: response.data, error: response.error), for: request)
            completion(buyMieResponse)
        }
    }

    private func prepareURLRequest(for request: BuyMieRequest) -> DataRequest {
        // Compose the url
        let path = "\(environment.host)\(request.path)"
        var headers: [String: String] = [:]
        var bodyParams: [String: Any]? = [:]
        
        // Working with parameters
        switch request.parameters {
        case .body(let params):
            // Parameters are part of the body
            bodyParams = params
        case .url(let params):
            break
//            print(params ?? "")
            // Parameters are part of the url
            //TODO: implemenet url
        }
        // Add headers from enviornment and request
        environment.headers.forEach { headers[$0.key] = $0.value}
        request.headers?.forEach { headers[$0.key] = $0.value }
        
  
       let dateRequest =  Alamofire.request(path, method: request.method, parameters: bodyParams, encoding: JSONEncoding.default, headers: headers)
        print("path \(path)")
        print("headers \(headers)")
        print("bodyParams \(String(describing: bodyParams))")
        return dateRequest
    }
}


