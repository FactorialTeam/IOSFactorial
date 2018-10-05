//
//  FloatPriceFromat.swift
//  BuyMie
//
//  Created by Mnats on 6/28/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation

extension Float {
    var priceFormat: String {
        return String(format: "%.2f", self)
    }
    var priceEuroFormat: String {
        return String(format: "€%.2f", self)
    }
}

extension Double {
    var priceFormat: String {
        return String(format: "%.2f", self)
    }
    var priceEuroFormat: String {
        return String(format: "€%.2f", self)
    }
}
