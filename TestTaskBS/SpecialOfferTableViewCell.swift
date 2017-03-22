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
    @IBOutlet weak var nameOfSection: UILabel!
    @IBOutlet weak var checkingImage: UIImageView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var moreInformationButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    
    @IBOutlet weak var secondHeighConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        designFor(button: moreInformationButton)
    }
    
    
    func designFor(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(colorLiteralRed: 142 / 255, green: 110 / 255, blue: 81 / 255, alpha: 1.0).cgColor
        button.layer.masksToBounds = true
    }
    
    var showDetails = false {
        didSet {
            secondHeighConstraint.priority = showDetails ? 250 : 999
        }
    }
    
}
