//
//  NavRouter.swift
//  BuyMiePicker
//
//  Created by Mnats on 5/25/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import UIKit
final class NavRouter: NSObject, Router{
    
    private var completions: [UIViewController : () -> Void]
    
    private var rootViewController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.rootViewController = navigationController
        self.completions = [:]
        super.init()
    }
    
    public func present(_ module: Presentable, animated: Bool = true) {
        rootViewController.present(module.toPresentable(), animated: animated, completion: nil)
    }
    
    public func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: animated, completion: completion)
    }
    
    public func push(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {
        
        let controller = module.toPresentable()
        
        // Avoid pushing UINavigationController onto stack
        guard controller is UINavigationController == false else {
            return
        }
        
        if let completion = completion {
            completions[controller] = completion
        }
        
        rootViewController.pushViewController(controller, animated: animated)
    }
    
    public func popModule(animated: Bool = true)  {
        if let controller = rootViewController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    public func setRootModule(_ module: Presentable, hideBar: Bool = false) {
        // Call all completions so all coordinators can be deallocated
        completions.forEach { $0.value() }
        rootViewController.setViewControllers([module.toPresentable()], animated: false)
        rootViewController.isNavigationBarHidden = hideBar
    }
    
    public func popToRootModule(animated: Bool) {
        if let controllers = rootViewController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }
    
    public func popToModule(_ module: Presentable, animated: Bool) {
        if let controllers = rootViewController.popToViewController(module.toPresentable(), animated: animated){
            controllers.forEach { runCompletion(for: $0) }
        }
    }
    
    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    func switchTo(_ module: Presentable, completion: (() -> Void)? = nil) {
    }
    
    func setModules(_ modules: [Presentable]) {
        self.rootViewController.viewControllers = modules.map{ $0.toPresentable() }
    }
    
    // MARK: Presentable
    public func toPresentable() -> UIViewController {
        return rootViewController
    }
    
}
