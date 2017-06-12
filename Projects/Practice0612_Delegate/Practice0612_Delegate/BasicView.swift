//
//  BasicView.swift
//  Practice0612_Delegate
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol BasicViewDelegate {
    func showMomsTalking(isAble:Bool)
}

class BasicView: UIView {
    
    @IBOutlet var labelResult:UILabel?
    var delegate:BasicViewDelegate?
    
    override func awakeFromNib() {
        
    }
    
    func showResult(isAble:Bool) {
        
        if isAble {
            labelResult?.text = "YES-!!!"
        }else {
            labelResult?.text = "NO-!!!!! OMG- OTL-"
        }
        
    }

}
