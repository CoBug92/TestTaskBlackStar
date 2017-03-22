//
//  OrderingTableViewCell.swift
//  TestTaskBS
//
//  Created by Bogdan Kostyuchenko on 20.03.17.
//  Copyright © 2017 Bogdan Kostyuchenko. All rights reserved.
//

import UIKit

class PersonalInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var sectionNameLabel: UILabel!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    
    
    
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
        designFor(textField: firstTextField)
        designFor(textField: secondTextField)
        designFor(textField: thirdTextField)
    }

    func designFor(textField: UITextField) {
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(23, 0, 0)
    }
}
