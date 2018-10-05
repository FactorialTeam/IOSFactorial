//
//  AppRouterImp.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import UIKit
final class AppRouterImp: NSObject, AppRouter {
    
    private var window:UIWindow
    init(window:UIWindow) {
        self.window = window
    }
   
    func setRootModule(_ module: UIViewController?) {
        guard let controller = module else { return }
        window.rootViewController = controller
    }
}
