//
//  AutModulFactory.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/26/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import Foundation
protocol AuthModuleFactory {
    func makeSignInViewController(delegate:SignInViewControllerDelegate) -> SignInViewController
    func makeInitialViewController() -> InitialViewController
    func makeSignUpViewController(delegate: SignUpViewControllerDelegate) -> SignUpViewController
}
