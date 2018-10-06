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
    @IBOutlet weak var tableView: UITableView!
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
            strongSelf.tableView.reloadData()
            
        }) { (error, statusCode) in
           
            }
        }
}


extension FolderViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as? FolderTableViewCell
            else {
                return UITableViewCell()
        }
        if let folders =  folders {
            let folder = folders[indexPath.row]
            cell.configure(with: folder.folderName)
        }
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let folders = self.folders , let folderId = folders[indexPath.row].folderId else { return }
        let vc = BaseModulFactoryImp().makeFileListViewController(folderId: folderId)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

