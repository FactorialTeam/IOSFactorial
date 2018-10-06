//
//  HomeViewController.swift
//  Factorial
//
//  Created by Mnats on 10/5/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit
import SwiftOCR

class HomeViewController: UIViewController {

    private lazy var menuButtonItem = UIBarButtonItem.makeMenuBarButton(for: self, action: #selector(menuItemPressed(_:)))
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
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
    
    @IBAction func generateFromPhotoAction(_ sender: Any) {
        let vc = BaseModulFactoryImp().makeCameraViewController()
        self.navigationController?.pushViewController(vc, animated: true)
//        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
//            print("can't open photo library")
//            return
//        }
//
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.delegate = self
//
//        present(imagePicker, animated: true)
    }
}


extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        defer {
            picker.dismiss(animated: true)
        }
        
        print(info)
        // get the image
//        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
        let swiftOCRInstance = SwiftOCR()
        
        swiftOCRInstance.recognize(image) { recognizedString in
            print(recognizedString)
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        defer {
            picker.dismiss(animated: true)
        }
        
        print("did cancel")
    }
}
