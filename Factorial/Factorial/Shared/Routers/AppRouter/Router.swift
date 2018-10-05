//
//  Router.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/27/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
protocol Router: class {
    
    func present(_ module: Presentable, animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
    func setRootModule(_ module: Presentable, hideBar: Bool)
    func popToRootModule(animated: Bool)
    func popToModule(_ module: Presentable, animated: Bool)
    func switchTo(_ module: Presentable, completion: (() -> Void)?)
    func setModules(_ modules: [Presentable])
    
}
