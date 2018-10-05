//
//  FolderViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

class FolderViewController: UIViewController {

    private lazy var menuButtonItem = UIBarButtonItem.makeMenuBarButton(for: self, action: #selector(menuItemPressed(_:)))
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Actions
    @objc private func menuItemPressed(_ sender: Any) {
        self.mm_drawerController.toggle(.left, animated: true, completion: nil)
    }
    

}
