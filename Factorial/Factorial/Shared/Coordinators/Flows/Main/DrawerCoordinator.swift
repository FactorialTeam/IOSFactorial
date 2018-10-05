//
//  DrawerCoordinator.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import MMDrawerController
import Intercom
import FBSDKLoginKit
protocol DrawerCoordinatorDelegate:class {
    func coordinatorDidLogOut(coordinator:Coordinator)
}
final class DrawerCoordinator: BaseCoordinator {
   
    private unowned var delegate: DrawerCoordinatorDelegate
    private let router: AppRouter
    private let factory: BaseModulFactory
    private lazy var drawerController: MMDrawerController = self.makedrawerController()
    private lazy var slideRouter = SlideRouter(drawer: drawerController)
    private var isRattingPresented: Bool {
        for element in childCoordinators {
            if element is ShopperRatingCoordinator {
                return true
            }
        }
        return false
    }
    
    init(router: AppRouter, delegate:DrawerCoordinatorDelegate , factory: BaseModulFactory) {
        self.delegate = delegate
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        router.setRootModule(self.drawerController)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            self.tryToSubmitShopperRating()
        })
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
        self.swich(to: MenuItem.shop)
    }
    
    @objc func logoutNotification(notification: NSNotification){
        self.delegate.coordinatorDidLogOut(coordinator: self)
        self.logout()
    }
    
    private func logout() {
        User.shared().clear()
        IntercomManager.logOut()
        
        let savedKeys = ["ZipName", "ZipID", "User", "CurrentBranchName", "CurrentBranchID"]
        let userDefault = UserDefaults.standard
        for deletedKey in savedKeys {
            userDefault.removeObject(forKey: deletedKey)
        }
        userDefault.synchronize()
        
        if let _ = FBSDKAccessToken.current() {
           let loginManager =  FBSDKLoginManager()
           loginManager.logOut()
        }
    }
    
    func tryToSubmitShopperRating() {
        if !self.isRattingPresented {
            self.startShooperRating()
        }
    }
    
    private func makedrawerController() -> MMDrawerController {
        let menuVC = factory.makeMenuViewController(delegate: self)
        let storsViewControlle = factory.makeStorsViewController()
        storsViewControlle.delegate = self
        storsViewControlle.openedFromMenu = true
        let storsViewControlleNavController = storsViewControlle.embedInNavigationController()
        let drawer = factory.makeDrawerController(center:storsViewControlleNavController , leftDrawerViewController:menuVC )
        return drawer
    }
    
    private func startShooperRating() {
        let coordinator = ShopperRatingCoordinator(router: slideRouter, delegate: self, factory: factory)
        addDependency(coordinator)
        coordinator.start()
    }
}

//MARK: MenuViewControllerDelegate
extension DrawerCoordinator: MenuViewControllerDelegate {
    func menucontroller(_ controller: MenuViewController, didSelect menuItem:MenuItem ) {
        swich(to: menuItem)
    }
    
    private func swich(to item:MenuItem) {
        switch item {
        case .help:
                Intercom.presentHelpCenter()
        case .question:
            Intercom.presentMessenger()
        default:
            self.changeRootModule(for: item)
        }
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
        case .shop:
            let storsViewControlle = factory.makeStorsViewController()
            storsViewControlle.delegate = self
            storsViewControlle.openedFromMenu = true
            return storsViewControlle
        case .account:
            return factory.makeMyMyAccountViewController(delegate: self)
        case .orders:
            return factory.makeMyOrdersViewController()
        case .refer:
            return factory.makeReferFriendsViewController()
        default:
            return nil
        }
    }
    
    private func showStorsViewController() {
        let storsViewControlle = BaseModulFactoryImp().makeStorsViewController()
        storsViewControlle.delegate = self
        let storsNavigation = storsViewControlle.embedInNavigationController()
        self.slideRouter.present(storsNavigation, animated: true)
    }
    
}

//MARK: MenuViewControllerDelegate
extension DrawerCoordinator: MyAccountViewControllerDelegate {
    func didLogedOut() {
        slideRouter.popToRootModule(animated: false)
        delegate.coordinatorDidLogOut(coordinator: self)
    }
}

//MARK: MenuViewControllerDelegate
extension DrawerCoordinator: ShopperRatingCoordinatorDelegate {
    func coordinatorDidCloseRatingView(coordinator:Coordinator) {
        self.removeDependency(coordinator)
    }
}

//MARK: StorsViewControllerDelegate
extension DrawerCoordinator: StorsViewControllerDelegate {
    func storsViewControllerDidSelect(store: Store) {
        let vc = factory.makeRetailHomePageViewController(storeProductCategory: nil)
        let navController = vc.embedInNavigationController()
        slideRouter.switchTo(navController)
    }
}
