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
    func makeHomeViewController() -> HomeViewController
    func makeFolderViewController() -> FolderViewController
    func makeMenuViewController(delegate: MenuViewControllerDelegate) -> MenuViewController
    func makeGenerateViewController() -> GenerateViewController
    
}


