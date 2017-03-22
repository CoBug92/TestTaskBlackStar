//
//  ProductTableViewCell.swift
//  TestTaskBS
//
//  Created by Bogdan Kostyuchenko on 21.03.17.
//  Copyright © 2017 Bogdan Kostyuchenko. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var nameOfSection: UILabel!
    @IBOutlet weak var checkingImage: UIImageView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var someImage: UIImageView!

    @IBOutlet weak var secondHeighConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var showDetails = false {
        didSet {
            secondHeighConstraint.priority = showDetails ? 250 : 999
        }
    }


}
