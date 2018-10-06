//
//  SaveQuestionViewController.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

class SaveQuestionViewController: UIViewController {

    var file: FileModel?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var folderNametextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
    }
    
    //MARK: Actiom
    @IBAction func saveAction(_ sender: Any) {
        self.save()
    }
    
    private func save() {
        guard let fileToSend = file, let tilte = folderNametextField.text else {
            return
        }
        
        let task = AddQuestionsTask(file: fileToSend, title: tilte)
        task.execute(in: NetworkDispatcher.autDispatcher(), taskCompletion: {  [weak self] (value) in
            guard  let strongSelf = self else { return }
            strongSelf.complateGeneration()
        }) { (error, statusCode) in
            
        }
    }
    
    private  func complateGeneration() {
        self.navigationController?.popViewController(animated: true)
    }
}


extension SaveQuestionViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return file?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as? FolderTableViewCell
            else {
                return UITableViewCell()
        }
        if let questios =  file?.questions {
            let question = questios[indexPath.row]
            cell.configure(with: question.text, hideArrow: true)
        }
        
        return cell
        
    }
}


