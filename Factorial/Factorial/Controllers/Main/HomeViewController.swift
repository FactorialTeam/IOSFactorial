//
//  HomeViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var menuButtonItem = UIBarButtonItem.makeMenuBarButton(for: self, action: #selector(menuItemPressed(_:)))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
    }
    
    private func configureNavigation() {
        self.navigationItem.leftBarButtonItem = menuButtonItem
    }
    //MARK: Actions
    @objc private func menuItemPressed(_ sender: Any) {
        self.mm_drawerController.toggle(.left, animated: true, completion: nil)
    }
    
    @IBAction func generateTextAction(_ sender: Any) {
        let generateTextViewController = BaseModulFactoryImp().makeGenerateViewController()
        self.navigationController?.pushViewController(generateTextViewController, animated: true)
    }
    
    

}
