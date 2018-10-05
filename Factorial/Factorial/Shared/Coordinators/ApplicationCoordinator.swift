//
//  ApplicationCoordinator.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
final class ApplicationCoordinator: BaseCoordinator {
    private let router: AppRouter
    private let coordinatorFactory: CoordinatorFactory

    init(router: AppRouter, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
       runAuthFlow()
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
    
}

//MARK: DrawerCoordinatorDelegate
extension ApplicationCoordinator: DrawerCoordinatorDelegate {
    func coordinatorDidLogOut(coordinator:Coordinator) {

        self.runAuthFlow()
        self.removeDependency(coordinator)
    }
}

//MARK: AuthCoordinatorDelegate
extension ApplicationCoordinator: AuthCoordinatorDelegate {
    func coordinatorDidAuthenticate(coordinator:Coordinator) {
            self.runMainFlow()
            self.removeDependency(coordinator)
    }
}


