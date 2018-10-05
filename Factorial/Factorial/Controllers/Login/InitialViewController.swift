//
//  InitialViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit
protocol InitialViewControllerDelegate: class {
    func didCompleteAutoLogin()
    func didTapSigninButton()
    func didTapSignUpButton()
}
class InitialViewController: UIViewController {

    weak var delegate: InitialViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func signInActiom(_ sender: Any) {
        delegate?.didTapSigninButton()
    }
    
    @IBAction func signUpActiom(_ sender: Any) {
        delegate?.didTapSignUpButton()
    }

}
