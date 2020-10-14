//
//  ConfirmView.swift
//  Practice0612_Delegate
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol confirmVeiwDelegate {
    func didSelectedYes(item:ConfirmView)
    func didSelectedNo(item:ConfirmView)
}

class ConfirmView: UIView {
    
    var delegate:confirmVeiwDelegate?
    
    override func awakeFromNib() {
        
    }
    
    @IBAction func buttonYes(_ sender:UIButton) {
        delegate?.didSelectedYes(item: self)
    }
    
    @IBAction func buttonNo(_ sender:UIButton) {
        delegate?.didSelectedNo(item: self)
    }


}
