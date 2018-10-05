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
    private var folders: [FolderModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.loadFolders()
        
    }
    
    private func configureNavigation() {
        self.navigationItem.leftBarButtonItem = menuButtonItem
    }
    
    //MARK: Actions
    @objc private func menuItemPressed(_ sender: Any) {
        self.mm_drawerController.toggle(.left, animated: true, completion: nil)
    }
    
    private func loadFolders() {
        
        let task = GetAllFoldersTask()
        task.execute(in: NetworkDispatcher.autDispatcher(), taskCompletion: {  [weak self] (value) in
            guard let folderList = value, let strongSelf = self else { return }
            strongSelf.folders = folderList
            
        }) { (error, statusCode) in
           
            }
        }
    

}
