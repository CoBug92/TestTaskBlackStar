//
//  OfferTableViewCell.swift
//  TestTaskBS
//
//  Created by Bogdan Kostyuchenko on 21.03.17.
//  Copyright © 2017 Bogdan Kostyuchenko. All rights reserved.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var offerButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    
    
//    @IBOutlet weak var secondViewHeighConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
