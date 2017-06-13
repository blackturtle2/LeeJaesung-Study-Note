//
//  BottomView.swift
//  Practice0613_DelegateCustomView
//
//  Created by leejaesung on 2017. 6. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol BottomViewDelegate {
    func pressResetButton()
}

class BottomView: UIView {
    
    var delegate:BottomViewDelegate?
    
    
    override func awakeFromNib() {
        
    }

    @IBAction func buttonReset(_ sender:UIButton) {
        delegate?.pressResetButton()
    }

}
