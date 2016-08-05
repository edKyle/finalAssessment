//
//  TableViewCell.swift
//  final Assessment
//
//  Created by Kyle on 8/4/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var PictureImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
