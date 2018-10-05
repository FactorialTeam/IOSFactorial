//
//  ApplicationCoordinator.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import Kingfisher
final class ApplicationCoordinator: BaseCoordinator {
    private let maxCachePeriodInSecond:Double = 60*60*2
    private let router: AppRouter
    private let coordinatorFactory: CoordinatorFactory
    private lazy var forceUpdateManager: ForceUpdateManager = ForceUpdateManager()

    init(router: AppRouter, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
      ImageCache.default.maxCachePeriodInSecond = self.maxCachePeriodInSecond
      ImageCache.default.cleanExpiredDiskCache()
       runAuthFlow()
    }
    
    @objc func checkForForceUpdate() {
        forceUpdateManager.checkVersion()
    }
    
    @objc func tryToSubmitShopperRating() {
        for element in childCoordinators {
            if element is DrawerCoordinator {
                if let drawer = element as? DrawerCoordinator{
                    drawer.tryToSubmitShopperRating()
                    return
                } 
            }
        }
    }
    //MARK: Flows
    fileprivate func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: self.router, delegate: self)
        addDependency(coordinator)
        coordinator.start()
    }
    
    fileprivate func runMainFlow() {
        let coordinator = coordinatorFactory.makeDrawerCoordinator(router: self.router, delegate: self)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func sendDeviceToken() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let userID = User.shared().userID {
            appDelegate.sendDeviceTokenforUserID(userID)
        }
    }
}

//MARK: DrawerCoordinatorDelegate
extension ApplicationCoordinator: DrawerCoordinatorDelegate {
    func coordinatorDidLogOut(coordinator:Coordinator) {
//        dataManager.authorizationManager.logout()
        self.runAuthFlow()
        self.removeDependency(coordinator)
    }
}

//MARK: AuthCoordinatorDelegate
extension ApplicationCoordinator: AuthCoordinatorDelegate {
    func coordinatorDidAuthenticate(coordinator:Coordinator) {
            self.sendDeviceToken()
            self.runMainFlow()
            self.removeDependency(coordinator)
    }
}


