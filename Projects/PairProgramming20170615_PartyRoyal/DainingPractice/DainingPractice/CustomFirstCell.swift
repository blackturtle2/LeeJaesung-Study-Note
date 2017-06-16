//
//  CustomFirstCell.swift
//  DainingPractice
//
//  Created by 김태형 on 2017. 6. 15..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

protocol CustomCellSaveText {
    func notiTextField()
}

class CustomFirstCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var myTextfield: UITextField!
    var strIndex:Int?
    var delegate:CustomCellSaveText?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        delegate?.notiTextField()
        print("textFieldShouldEndEditing")
        
        return true
    }
    

}
