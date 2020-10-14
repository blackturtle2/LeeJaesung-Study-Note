//
//  CustomView.swift
//  Practice0613_DelegateCustomView
//
//  Created by leejaesung on 2017. 6. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol CustomDelegate {
    func pressButton()
}

class CustomView: UIView {
    
    @IBOutlet var labelResult:UILabel?
    @IBOutlet var buttonOkay:UIButton?
    
    var delegate:CustomDelegate?

    override func awakeFromNib() {
        
    }
    
    @IBAction func buttonOkayAction(_ sender:UIButton) {
        let vStr:String = (labelResult?.text)!
        labelResult?.text = "\(vStr) *"
        
        delegate?.pressButton()
    }
    
}
