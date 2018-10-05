//
//  NSDateHelper.swift
//  BuyMie
//
//  Created by Mnats on 6/30/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
extension Date {
    var age: Int {
        let calendar: Calendar = Calendar.current
        let now = calendar.startOfDay(for: Date())
        let birthdate = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([Calendar.Component.year], from: birthdate, to: now)
        return components.year!
    }
    
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter.string(from: self)
    }
    
    func string(for format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

extension NSDate {
    @objc var age: Int {
        let date = self as Date
        return date.age
    }
}
