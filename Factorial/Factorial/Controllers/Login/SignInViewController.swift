//
//  SignInViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

protocol SignInViewControllerDelegate: class {
    func didSuccessfullyLogin()
}
class SignInViewController: UIViewController {

    weak var delegate: SignInViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
