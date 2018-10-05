//
//  UIBarButtonItemDefaultButtons.swift
//  BuyMie
//
//  Created by Mnats on 6/25/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation
import UIKit
extension UIBarButtonItem {
    
    class func mekeCloseBarButton(for target: Any, action: Selector ) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let image = UIImage(named: "close_nav_button")
        button.contentHorizontalAlignment  = .left
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    @objc class func makeMenuBarButton(for target: Any, action: Selector ) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
//        let image = UIImage(named: "menuButton.png")
        let image = UIImage(named: "home_menu_icon")
        button.contentHorizontalAlignment  = .left
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    @objc class func makeBackButton(for target: Any, action: Selector ) -> UIBarButtonItem{
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let backImage = UIImage(named: "back_nav_button")
//        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backButton.contentHorizontalAlignment  = .left
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: backButton)
    }
    
    class func makeSearchButton(for target: Any, action: Selector ) -> UIButton{
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 32))
        let backImage = UIImage(named: "search.png")
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(target, action: action, for: .touchUpInside)
        return backButton
    }
    
}

