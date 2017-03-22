//
//  OrderingTableViewCell.swift
//  TestTaskBS
//
//  Created by Bogdan Kostyuchenko on 20.03.17.
//  Copyright © 2017 Bogdan Kostyuchenko. All rights reserved.
//

import UIKit

class OrderingTableViewCell: UITableViewCell {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var nameOfSection: UILabel!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var checkingImage: UIImageView!
    
    
    
    @IBOutlet weak var secondHeighConstraint: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        designFor(textField: phoneNumberTF)
        designFor(textField: nameTF)
        designFor(textField: emailTF)
    }

    func designFor(textField: UITextField) {
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(23, 0, 0)
    }
    
    func Rotation() {
        checkingImage.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
    }

    var showDetails = false {
        didSet {
            secondHeighConstraint.priority = showDetails ? 250 : 999
        }
    }
}
