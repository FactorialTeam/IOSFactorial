//
//  CoordinatorFactoryImp.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import UIKit
final class CoordinatorFactoryImp:NSObject, CoordinatorFactory {
    @objc func makeApplicationCoordinator(in window:UIWindow) ->  ApplicationCoordinator {
        return ApplicationCoordinator(router: AppRouterImp(window: window), coordinatorFactory:  CoordinatorFactoryImp())
    }
    
    func makeDrawerCoordinator(router: AppRouter, delegate:DrawerCoordinatorDelegate) ->  DrawerCoordinator {
       return DrawerCoordinator(router: router, delegate: delegate, factory: BaseModulFactoryImp())
    }
    
    func makeAuthCoordinator(router: AppRouter, delegate:AuthCoordinatorDelegate) -> AuthCoordinator {
        return AuthCoordinator(router: router, delegate: delegate, factory: AuthModuleFactoryImp())
    }
    
    
}
