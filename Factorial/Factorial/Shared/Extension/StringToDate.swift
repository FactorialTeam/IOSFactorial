//
//  StringToDate.swift
//  BuyMie
//
//  Created by Mnats on 6/30/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
extension String {

     func date() -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY HH:mm:ss a"
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension NSString {
    @objc func date() -> Date?{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "dd/MM/yyyy hh:mm:ss a"

        let date = formatter.date(from: self as String)
        return date
    }
}
