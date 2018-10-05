//
//  ShopperRatingCoordinator.swift
//  BuyMie
//
//  Created by Mnats on 6/21/18.
//  Copyright © 2018 7Smart. All rights reserved.
//

import Foundation

protocol ShopperRatingCoordinatorDelegate:class {
    func coordinatorDidCloseRatingView(coordinator:Coordinator)
}
final class ShopperRatingCoordinator: BaseCoordinator {
    
    private unowned var delegate: ShopperRatingCoordinatorDelegate
    private let router: Router
    private let factory: BaseModulFactory
    
    init(router: Router, delegate: ShopperRatingCoordinatorDelegate , factory: BaseModulFactory) {
        self.delegate = delegate
        self.router = router
        self.factory = factory
    }
    
    override func start() {
       self.requestOrderForRate()
    }
    
    private func requestOrderForRate() {
        guard let userID =  User.shared().userID else {
            delegate.coordinatorDidCloseRatingView(coordinator: self)
            return
        }
        let task = BuyMieOrderForRateTask(userID: userID)
        task.execute(in: NetworkDispatcher.autDispatcher(), taskCompletion: {  [weak self] (value) in
            
            guard let orderDict = value, let strongSelf = self else {
                self?.delegate.coordinatorDidCloseRatingView(coordinator: self!)
                return
            }
            strongSelf.showShopperRatingViewController(for: orderDict)
            
        }) {[weak self] (_, _) in
            guard let strongSelf = self else {return}
            strongSelf.delegate.coordinatorDidCloseRatingView(coordinator: strongSelf)
        }
    }
    
    private func showShopperRatingViewController(for order: [String: Any]) {
        let vc = factory.makeShopperRatingViewController(delegate: self)
        vc.custommerOrder = order
        self.router.present(vc, animated: true)
    }
}

//
extension ShopperRatingCoordinator: BMUserOrderInfoDelegate {
    func userInfoViewDidCloseView(_ shopperInfoView: ShopperRatingViewController!) {
//        self.router.dismissModule(animated: true, completion: nil)
        self.delegate.coordinatorDidCloseRatingView(coordinator: self)
    }
    
    
}
