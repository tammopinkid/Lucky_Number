//
//  RoundLabel.swift
//  Lucky_Number
//
//  Created by Kamonwat Rojjanadechakul on 11/15/2560 BE.
//  Copyright © 2560 Benjarat Saeang. All rights reserved.
//

import UIKit

@IBDesignable
class RoundLabel: UILabel {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
