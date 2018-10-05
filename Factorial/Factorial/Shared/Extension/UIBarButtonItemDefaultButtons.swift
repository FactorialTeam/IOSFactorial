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
    
    class func makeSearchBar() -> UISearchBar {
        let screenWidth = UIScreen.main.bounds
        let width  = screenWidth.size.width / 20 * 11
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: width, height: 32)
        
        if #available(iOS 11.0, *)  {
            searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        searchBar.searchBarStyle = .minimal;
        searchBar.barTintColor = Appconstants.Color.darkRed//UIColor(red: 211.0/255.0, green: 0.0/255.0, blue: 35.0/255.0, alpha: 1)
        searchBar.backgroundColor = Appconstants.Color.Navigation.barTint
        searchBar.tintColor = UIColor.white
        
        searchBar.setImage(UIImage(named: "SearchIcon"), for: .search, state: .normal)
        let attribute = [NSAttributedStringKey.foregroundColor : UIColor.white]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attribute, for: .normal)
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
        searchBar.setValue(UIColor.white, forKeyPath: "_searchField._placeholderLabel.textColor")
        
        searchBar.placeholder = "Search"
        
        return searchBar
    }
    
    @objc class func mekeShoppingCartNavBar(for target: Any, action: Selector ) -> UIBarButtonItem{
        let shoppingCartNavBarItemView = ShoppingCartNavBarItemView.nib()
        return UIBarButtonItem(customView: shoppingCartNavBarItemView)
    }
    
    
    
}

