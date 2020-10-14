//
//  VendingMachineView.swift
//  Practice0612_CustomView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol VendingViewDelegate {
    func didSelected(item:VendingMachineView)
    func isAbleToTouch() -> Bool
}

class VendingMachineView: UIView {
    
    var delegate:VendingViewDelegate?
    
    @IBOutlet var vImageView:UIImageView?
    @IBOutlet var vLabel:UILabel?

    override func awakeFromNib() {
        
    }
    
    func setImageView(fileName:String) {
        vImageView?.image = UIImage(named: fileName)
    }
    
    @IBAction func coverButtonAction(_ sender:UIButton) {
        print("coverButtonAction")
        
        if delegate?.isAbleToTouch() ?? false {
            delegate?.didSelected(item: self)
        }
    }

}
