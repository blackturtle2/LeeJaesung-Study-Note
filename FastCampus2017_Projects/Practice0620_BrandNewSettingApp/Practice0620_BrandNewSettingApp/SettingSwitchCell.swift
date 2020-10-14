//
//  SettingSwitchCell.swift
//  Practice0620_BrandNewSettingApp
//
//  Created by leejaesung on 2017. 6. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

protocol SettingSwitchCellDelegate {
    func cellValueChanged(_ cell:SettingSwitchCell, isOn:Bool)
}

class SettingSwitchCell: UITableViewCell {
    
    @IBOutlet var switcher:UISwitch?
    @IBOutlet var labelTitle:UILabel?
    
    var delegate:SettingSwitchCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Cell의 타이틀 설정
    func setTitle(_ title:String){
        labelTitle?.text = title
    }
    
    @IBAction func switcherValueChangeAction(_ sender: UISwitch) {
        delegate?.cellValueChanged(self, isOn: sender.isOn)
    }
    

}
