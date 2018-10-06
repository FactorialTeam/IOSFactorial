//
//  MenuViewController.swift
//  BuyMiePicker
//
//  Created by Mnats on 4/28/18.
//  Copyright © 2018 BuyMie. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    func menucontroller(_ controller: MenuViewController, didSelect menuItem:MenuItem )
}
class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    private let menuItems = MenuItem.allItems
    weak var delegate:MenuViewControllerDelegate?
    lazy var doOnce: () -> Void = {
        self.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        return {}
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doOnce()
        
    }
    
}
//Mark: UITableViewDelegate , UITableViewDataSource
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "MenuCell")
            cell?.selectedBackgroundView = UIView(frame: .zero)
            cell?.selectedBackgroundView?.backgroundColor = UIColor.white
        }
        let menuItem = menuItems[indexPath.row]
        self.configure(cell: cell, with: menuItem)
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        delegate?.menucontroller(self, didSelect: menuItem)
    }
    
    //Mark: Cell Configuration
    private func configure(cell: UITableViewCell? , with menuItem: MenuItem) {
        if let cell = cell {
            cell.backgroundColor = UIColor.clear
            cell.textLabel?.text = menuItem.title
            cell.textLabel?.font = Appconstants.Fonts.regularNormalFont
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.highlightedTextColor = UIColor.black
//            cell.textLabel?.highlightedTextColor = UIColor(red: 220.0/255.0, green: 31.0/255.0, blue: 39.0/255.0, alpha: 1)
            cell.imageView?.image = UIImage(named: menuItem.iconName)
            cell.imageView?.highlightedImage = UIImage(named: menuItem.selectedIconName)
        }
    }
}

