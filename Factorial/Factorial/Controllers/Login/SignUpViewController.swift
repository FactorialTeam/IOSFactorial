//
//  SignUpViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

protocol SignUpViewControllerDelegate: class {
    func didSuccessfullySignUp()
}

class SignUpViewController: UIViewController {

    weak var delegate: SignUpViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
