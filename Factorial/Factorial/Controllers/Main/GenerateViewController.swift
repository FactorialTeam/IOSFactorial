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
        print("generateTextAction")
    }

}
