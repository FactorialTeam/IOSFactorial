//
//  MenuItem.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/27/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
enum MenuItem {
    case home
    case folder
   
    static let allItems:[MenuItem] = [.home, .folder,]
    
    var title:String {
        switch self {
        case .home:
            return "Home"
        case .folder:
            return "Folder"
        }
    }
    
    var iconName:String {
        switch self {
        case .home:
            return "Shop.png"
        case .folder:
            return "ListsRecipes.png"
        }
    }
    
    var selectedIconName:String {
        switch self {
        case .home:
            return "Shop.png"
        case .folder:
            return "ListsRecipes.png"
        }
    }
    
}


