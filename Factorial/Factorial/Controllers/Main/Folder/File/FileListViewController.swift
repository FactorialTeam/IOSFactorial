//
//  FileListViewController.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController {

    var folderId: Int?
    private var files: [FileModel]?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFiles()
        self.navigationItem.title = "Files"
        
    }
    
    private func loadFiles() {
        guard let folderId = folderId else {return}
        let task = GetFilesTasks(folderId: folderId)
        task.execute(in: NetworkDispatcher.autDispatcher(), taskCompletion: {  [weak self] (value) in
            guard let files = value, let strongSelf = self else { return }
            strongSelf.files = files
            strongSelf.tableView.reloadData()
            
        }) { (error, statusCode) in
            
        }
    }
}


extension FileListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as? FolderTableViewCell
            else {
                return UITableViewCell()
        }
        if let files =  files {
            let file = files[indexPath.row]
            cell.configure(with: file.title)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let files = files else {
            return
        }
        let file = files[indexPath.row]
        let vc = BaseModulFactoryImp().makeQuestionsViewController(file: file)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


