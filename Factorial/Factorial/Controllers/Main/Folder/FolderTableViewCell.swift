//
//  FolderTableViewCell.swift
//  Factorial
//
//  Created by Mnats on 10/6/18.
//  Copyright © 2018 Mnats. All rights reserved.
//

import UIKit

class FolderTableViewCell: UITableViewCell {

    @IBOutlet weak var foldaerNameLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with title: String, hideArrow: Bool = false) {
        foldaerNameLabel.text = title
        if hideArrow {
            arrowImageView?.isHidden = true
        }
    }

}

