//
//  UINavigationControllerAdditions.swift
//  BuyMiePicker
//
//  Created by Mnats on 5/25/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//


import UIKit
extension UINavigationController {
    @objc class func defaultNavController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor = Appconstants.Color.Navigation.barTint
        navigationController.navigationBar.tintColor = Appconstants.Color.Navigation.tint
        navigationController.navigationBar.isTranslucent = false
        let textAttributes = [NSAttributedStringKey.foregroundColor:Appconstants.Color.Navigation.tint, NSAttributedStringKey.font: Appconstants.Fonts.nvigationTitleFont]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        return navigationController
    }
}
