//
//  CircleView.swift
//  Practice0612_CustomView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    @IBOutlet var title:UILabel?
    @IBOutlet var okBtn:UIButton?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        
        self.layer.backgroundColor = UIColor.blue.cgColor
        
        okBtn?.setTitleColor(UIColor.red, for: .normal)

    }
    
    func setTitleText(_ text:String) {
        if let titleLB = title {
            titleLB.text = text
        }
    }

}
