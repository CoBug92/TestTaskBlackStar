//
//  SpecialOfferTableViewCell.swift
//  TestTaskBS
//
//  Created by Bogdan Kostyuchenko on 21.03.17.
//  Copyright © 2017 Bogdan Kostyuchenko. All rights reserved.
//

import UIKit

class SpecialOfferTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var sectionNameLabel: UILabel!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var specialOfferImage: UIImageView!
    @IBOutlet weak var specialOfferLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    
    @IBOutlet weak var secondViewHeighConstraint: NSLayoutConstraint!
    
    
    
    
    
    
    
    var showDetails = false {
        didSet {
            secondViewHeighConstraint.priority = showDetails ? 250 : 999
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        designFor(button: readMoreButton)
    }
    
    
    
    func designFor(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(colorLiteralRed: 142 / 255, green: 110 / 255, blue: 81 / 255, alpha: 1.0).cgColor
        button.layer.masksToBounds = true
    }
    
}
