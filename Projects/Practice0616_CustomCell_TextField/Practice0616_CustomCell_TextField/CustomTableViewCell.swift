//
//  CustomTableViewCell.swift
//  Practice0616_CustomCell_TextField
//
//  Created by leejaesung on 2017. 6. 16..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol ProtocolCustomCell {
    func returnCustomCellSelf(item:CustomTableViewCell)
    func customCellTextFieldShouldReturn(item:CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var textViewUserName:UITextField?
    
    var cellDelegate:ProtocolCustomCell?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textViewUserName?.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("customCell textFieldShouldReturn")
        cellDelegate?.returnCustomCellSelf(item: self)
        cellDelegate?.customCellTextFieldShouldReturn(item: self)
        
        textField.resignFirstResponder() //키보드 내리기
        
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cellDelegate?.returnCustomCellSelf(item: self)
//        print("customCell textFieldDidEndEditing")
        
        cellDelegate?.customCellTextFieldShouldReturn(item: self)
    }
    
}
