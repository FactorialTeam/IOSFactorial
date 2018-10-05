//
//  CoordinatorFactory.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//
import UIKit
protocol CoordinatorFactory: class {
    func makeApplicationCoordinator(in window: UIWindow) ->  ApplicationCoordinator
    func makeDrawerCoordinator(router: AppRouter, delegate:DrawerCoordinatorDelegate) ->  DrawerCoordinator
    func makeAuthCoordinator(router: AppRouter, delegate:AuthCoordinatorDelegate) -> AuthCoordinator
}

