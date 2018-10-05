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
        self.configureNavigation()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Configuration
    private func configureNavigation() {
        
        let makeCloseButtonItem = UIBarButtonItem.mekeCloseBarButton(for: self, action: #selector(closeAction(_:)))
        self.navigationItem.leftBarButtonItem = makeCloseButtonItem;
    }
    //MARK: Actiom
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        self.delegate?.didSuccessfullySignUp()
    }
}
