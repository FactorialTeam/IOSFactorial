//
//  Environment.swift
//  BuyMie
//
//  Created by Mnats Karakhanyan on 3/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
enum APIVersion: String {
    case v2 = "v2"
    case v3 = "v3"
    case v4 = "v4" // Add eircode to address
    case v5 = "v5" // Add eircode to address
    case v6 = "v6" // New Jarvis and matkup
    static let lastVersion = APIVersion.v6
}
public struct Environment {
    
    static let baseUrl = "http://192.168.2.117/FC/api/Text/"

    static func defaultEnvironment(apiVersion: APIVersion = APIVersion.lastVersion) -> Environment {
        let host = baseUrl
        var env = Environment("Default", host: host )
        env.headers = ["Content-Type": "application/json"]
        //TODO: change autantication Logic

        return env
    }
    
    static func autEnvironment(apiVersion: APIVersion = APIVersion.lastVersion) -> Environment {
        let host = baseUrl
        var env = Environment("Aut", host: host )
        env.headers = ["Content-Type": "application/json"]
//        if let token =  env.autToken {
//            env.headers = ["Authorization": token]
//        }
        return env
    }
    
    let autTokenKey = "AccessToken"
    let tokenTypeKey = "TokenType"
    
   
    /// Name of the environment
    public var name: String
    
    /// Base URL of the environment
    public var host: String
    
    /// Base URL of the environment
//    public var apiVersion: String
    
    /// This is the list of common headers which will be part of each Request
    /// Some headers value maybe overwritten by Request's own headers
    public var headers: [String: String] = [:]
    
    /// Name of the environment
    public var autToken: String? {
        get {
            let userDefaults  = UserDefaults.standard
            guard let token = userDefaults.object(forKey: autTokenKey) as? String ,
                let tokenType = userDefaults.object(forKey: tokenTypeKey) as? String  else {
                    return nil
            }
            return "\(tokenType) \(token)"
        }
    }
    

    /// Initialize a new Environment
    ///
    /// - Parameters:
    ///   - name: name of the environment
    ///   - host: base url
    public init(_ name: String, host: String) {
        self.name = name
        self.host = host
        
    }
}
