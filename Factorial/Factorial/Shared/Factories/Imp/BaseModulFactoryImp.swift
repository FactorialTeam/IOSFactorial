
import Foundation
import MMDrawerController
final class BaseModulFactoryImp:NSObject, BaseModulFactory {
    
    func makeDrawerController(center: UIViewController, leftDrawerViewController: UIViewController) -> MMDrawerController {
        let drawerController =  MMDrawerController(center: center, leftDrawerViewController: leftDrawerViewController)!
        drawerController.showsShadow = false
        drawerController.restorationIdentifier = "MMDrawer"
        drawerController.maximumLeftDrawerWidth = 230
        drawerController.openDrawerGestureModeMask = .all
        drawerController.closeDrawerGestureModeMask = .all
        drawerController.setDrawerVisualStateBlock { (drawer, drawerSide, percentVisible) in
            if let block = MMDrawerVisualState.parallaxVisualStateBlock(withParallaxFactor: 2.0) {
                block(drawerController, drawerSide, percentVisible);
            }
        }
        return drawerController
    }
    
    func makeMenuViewController(delegate: MenuViewControllerDelegate) -> MenuViewController {
        let vc = MenuViewController.controllerFromStoryboard(.main)
        vc.delegate = delegate
        return vc
    }
    
    func makeReferFriendsViewController() -> ReferFriendsViewController {
        let vc = ReferFriendsViewController.controllerFromStoryboard(.iPhone)
        return vc
    }
    
    func makeMyOrdersViewController() -> MyOrdersViewController {
        let vc = MyOrdersViewController.controllerFromStoryboard(.order)
        return vc
    }
    
    func makeMyMyAccountViewController(delegate: MyAccountViewControllerDelegate) -> MyAccountViewController {
        let vc = MyAccountViewController.controllerFromStoryboard(.iPhoneX)
        vc.delegate = delegate
        return vc
    }
    
    func makeShopperRatingViewController(delegate: BMUserOrderInfoDelegate) -> ShopperRatingViewController{
        let vc = ShopperRatingViewController.controllerFromStoryboard(.main)
        vc.delegate = delegate
        return vc
    }
   
    @objc  func makeShoppingCartViewController() -> ShoppingCartViewController {
        let vc = ShoppingCartViewController.controllerFromStoryboard(.main)
        return vc
    }
    
    func makeCheckoutViewController() -> CheckoutViewController {
        let vc = CheckoutViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }
    
    @objc func makeProductDetailsViewController(for productID: Int,
                                          userID:String,
                                          branchID: Int,
                                          delegate: ProductDetailsViewControllerDelegate) -> ProductDetailsViewController {
        let vc = ProductDetailsViewController.controllerFromStoryboard(.main)
        vc.delegate = delegate
        vc.productID = productID
        vc.userID = userID
        vc.branchID = branchID
        return vc
    }
    
    func makeAddBirthDateViewController(for userID: String) -> AddBirthDateViewController {
        let vc = AddBirthDateViewController.controllerFromStoryboard(.main)
        vc.modalPresentationStyle = .overFullScreen
        return vc
    }
    
    @objc func makeStorsViewController() -> StorsViewController {
        let vc = StorsViewController.controllerFromStoryboard(.main)
        return vc
    }
    
    @objc func makeAddAddressWithEircodeViewController(with user: User, isFirstAddress: Bool, address: Address?) -> AddAddressWithEircodeViewController {
        let vc = AddAddressWithEircodeViewController.controllerFromStoryboard(.address)
        vc.user = user
        vc.isFirstAddress = isFirstAddress
        vc.address = address
        return vc
    }
    
    @objc func makeSearchEircodeViewController() -> SearchEircodeViewController {
        let vc = SearchEircodeViewController.controllerFromStoryboard(.address)
        return vc
    }
    
    @objc func makeChooseZipToAddAdressViewController() -> ChooseZipToAddAdressViewController {
        let vc = ChooseZipToAddAdressViewController.controllerFromStoryboard(.address)
        return vc
    }
    
    @objc func makeAddressesViewController() -> AddressesViewController {
        let vc = AddressesViewController.controllerFromStoryboard(.address)
        return vc
    }
    
    @objc func makeReAddOrderViewController() -> ReAddOrderViewController {
        let vc = ReAddOrderViewController.controllerFromStoryboard(.order)
        return vc
    }
    
    @objc func makeShareViewController() -> ShareViewController {
        let vc = ShareViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }
    
    @objc func makePaymentMethodsViewController() -> PaymentMethodsViewController {
        let vc = PaymentMethodsViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }
    
    @objc func makeAddPaymentMethodViewController() -> AddPaymentMethodViewController {
        let vc = AddPaymentMethodViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }
    
    @objc func makeUpdateAccountViewController() -> UpdateAccountViewController {
        let vc = UpdateAccountViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }
    
    @objc func makeChangePasswordViewController() -> ChangePasswordViewController
    {
        let vc = ChangePasswordViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }
    
    @objc func makeCouponCodeViewController() -> CouponCodeViewController
    {
        let vc = CouponCodeViewController.controllerFromStoryboard(.iPhoneX)
        return vc
    }

    @objc func makeViewPDFViewController(with orderID: String, storeBranchID: String?) -> ViewPDFViewController {
        let vc = ViewPDFViewController.controllerFromStoryboard(.order)
        vc.orderID = orderID
        vc.storeBranchID = storeBranchID
        return vc
    }
    
    func makeRetailHomePageViewController(storeProductCategory: StoreProductCategory?) -> RetailHomePageViewController {
        let vc = RetailHomePageViewController.controllerFromStoryboard(.main)
        vc.selectedCategory = storeProductCategory
        return vc
    }
    
    func makeSearchViewController(categoryId: String?) -> SearchProductViewController {
        let vc = SearchProductViewController.controllerFromStoryboard(.main)
        vc.categoryId = categoryId
        return vc
    }

    func makeStoreDepartmentViewController(branchId: String, departmentCategory: DepartmentCategory?) -> StoreDepartmentViewController {
        let vc = StoreDepartmentViewController.controllerFromStoryboard(.main)
        vc.branchid = branchId
        vc.departmentCategory = departmentCategory
        return vc
    }
    
    func makeSubCategoryProductListViewController(storeProductCategory: StoreProductCategory?) -> SubCategoryProductListViewController {
        let vc = SubCategoryProductListViewController.controllerFromStoryboard(.main)
        vc.selectedCategory = storeProductCategory
        return vc
    }
    
    func makeStoreProductListViewController(delegate:StoreProductListViewControllerDelegate) -> StoreProductListViewController {
        let vc = StoreProductListViewController.controllerFromStoryboard(.main)
        vc.delegate = delegate
        return vc
    }
    
    func makeWebViewController(url: String) -> WebViewController {
        let vc = WebViewController.controllerFromStoryboard(.main)
        vc.webUrl = url
        return vc
    }
    
    func makeCheckoutViewControllerSwift() -> CheckoutViewControllerSwift {
        let vc = CheckoutViewControllerSwift.controllerFromStoryboard(.checkOut)
        return vc
    }
    
    func makeCheckoutDateViewController(delegate: CheckoutDateViewControllerDelegate) -> CheckoutDateViewController {
        let vc = CheckoutDateViewController.controllerFromStoryboard(.checkOut)
        vc.delegate = delegate
        return vc
    }
    
    
    
}

