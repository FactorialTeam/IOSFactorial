//
//  DrawerCoordinator.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import MMDrawerController

protocol DrawerCoordinatorDelegate:class {
    func coordinatorDidLogOut(coordinator:Coordinator)
}
final class DrawerCoordinator: BaseCoordinator {
   
    private unowned var delegate: DrawerCoordinatorDelegate
    private let router: AppRouter
    private let factory: BaseModulFactory
    private lazy var drawerController: MMDrawerController = self.makedrawerController()
    private lazy var slideRouter = SlideRouter(drawer: drawerController)
    
    init(router: AppRouter, delegate:DrawerCoordinatorDelegate , factory: BaseModulFactory) {
        self.delegate = delegate
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        router.setRootModule(self.drawerController)
        addNotification()
    }
    
    private func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(goToMainPage(notification:)), name: Notification.Name("GoToMainPage"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(logoutNotification(notification:)), name: Notification.Name("AutirizationFailedNotofication"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func goToMainPage(notification: NSNotification){
        self.swich(to: MenuItem.home)
    }
    
    @objc func logoutNotification(notification: NSNotification){
        self.delegate.coordinatorDidLogOut(coordinator: self)
        self.logout()
    }
    
    private func logout() {
        
    }
    
    private func makedrawerController() -> MMDrawerController {
        let menuVC = factory.makeMenuViewController(delegate: self)
        let storsViewControlle = factory.makeHomeViewController()
   
        let storsViewControlleNavController = storsViewControlle.embedInNavigationController()
        let drawer = factory.makeDrawerController(center:storsViewControlleNavController , leftDrawerViewController:menuVC )
        return drawer
    }
}

//MARK: MenuViewControllerDelegate
extension DrawerCoordinator: MenuViewControllerDelegate {
    func menucontroller(_ controller: MenuViewController, didSelect menuItem:MenuItem ) {
        swich(to: menuItem)
    }
    
    private func swich(to item:MenuItem) {
        self.changeRootModule(for: item)
    }
    
    private func changeRootModule(for item:MenuItem) {
        if let viewController = module(for: item) {
            let navController = viewController.toPresentable().embedInNavigationController()
            slideRouter.switchTo(navController)
        }
    }
    
    private func module(for item:MenuItem) -> Presentable? {
        self.childCoordinators = []
        switch item {
        case .home:
            return factory.makeHomeViewController()
        case .folder:
            return factory.makeFolderViewController()
        default:
            return nil
        }
    }
    
}

