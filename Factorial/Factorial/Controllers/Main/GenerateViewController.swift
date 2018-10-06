//
//  GenerateViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController {

    @IBOutlet weak private var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: Actiom
    @IBAction func generateTextAction(_ sender: Any) {
        self.generate(text: textView.text!)
    }
    
    @IBAction func analiseAction(_ sender: Any) {
        self.showAnalizeText(textView.text!)
    }

    private func generate(text: String?) {
        guard let textToSend = text, !textToSend.isEmpty else {return}
        let task = AddTextTask(text: textToSend)
        task.execute(in: NetworkDispatcher.autDispatcher(), taskCompletion: {  [weak self] (value) in
            guard let file = value, let strongSelf = self else { return }
            strongSelf.procces(with: file)
        }) { (error, statusCode) in
            
        }
    }
    
    private func procces(with file: FileModel) {
        let vc = BaseModulFactoryImp().makeSaveQuestionViewController(file: file)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showAnalizeText(_ text: String) {
        let vc = BaseModulFactoryImp().makeTextAnalysisViewController(text: text)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
