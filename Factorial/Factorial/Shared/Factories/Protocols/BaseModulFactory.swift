//
//  MainModulFactory.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
import MMDrawerController
protocol BaseModulFactory {
    func makeDrawerController(center: UIViewController, leftDrawerViewController: UIViewController) -> MMDrawerController
    func makeMenuViewController(delegate: MenuViewControllerDelegate) -> MenuViewController
    func makeStorsViewController() -> StorsViewController
    func makeReferFriendsViewController() -> ReferFriendsViewController
    func makeMyOrdersViewController() -> MyOrdersViewController
    func makeMyMyAccountViewController(delegate: MyAccountViewControllerDelegate) -> MyAccountViewController
    func makeShopperRatingViewController(delegate: BMUserOrderInfoDelegate) -> ShopperRatingViewController
    func makeShoppingCartViewController() -> ShoppingCartViewController
    func makeCheckoutViewController() -> CheckoutViewController
    func makeProductDetailsViewController(for productID: Int,
                                          userID:String,
                                          branchID: Int,
                                          delegate: ProductDetailsViewControllerDelegate) -> ProductDetailsViewController
    func makeAddBirthDateViewController(for userID: String) -> AddBirthDateViewController
    func makeAddAddressWithEircodeViewController(with user: User, isFirstAddress: Bool, address: Address?) -> AddAddressWithEircodeViewController
    func makeSearchEircodeViewController() -> SearchEircodeViewController
    func makeChooseZipToAddAdressViewController() -> ChooseZipToAddAdressViewController
    func makeAddressesViewController() -> AddressesViewController
    
    func makeReAddOrderViewController() -> ReAddOrderViewController
    func makeShareViewController() -> ShareViewController
    func makePaymentMethodsViewController() -> PaymentMethodsViewController
    func makeAddPaymentMethodViewController() -> AddPaymentMethodViewController
    func makeUpdateAccountViewController() -> UpdateAccountViewController
    func makeChangePasswordViewController() -> ChangePasswordViewController
    func makeCouponCodeViewController() -> CouponCodeViewController
    func makeViewPDFViewController(with orderID: String, storeBranchID: String?) -> ViewPDFViewController
    func makeRetailHomePageViewController(storeProductCategory: StoreProductCategory?) -> RetailHomePageViewController
    func makeSearchViewController(categoryId: String?) -> SearchProductViewController
    func makeStoreDepartmentViewController(branchId: String, departmentCategory: DepartmentCategory?) -> StoreDepartmentViewController
    func makeSubCategoryProductListViewController(storeProductCategory: StoreProductCategory?) -> SubCategoryProductListViewController
    func makeStoreProductListViewController(delegate:StoreProductListViewControllerDelegate) -> StoreProductListViewController
    func makeWebViewController(url: String) -> WebViewController
    func makeCheckoutViewControllerSwift() -> CheckoutViewControllerSwift
    func makeCheckoutDateViewController(delegate: CheckoutDateViewControllerDelegate) -> CheckoutDateViewController
    
    
}


