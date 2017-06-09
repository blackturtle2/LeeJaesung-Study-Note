//
//  RoundButton.swift
//  Practice0609_CustomView
//
//  Created by leejaesung on 2017. 6. 9..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }

}
