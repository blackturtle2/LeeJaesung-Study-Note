//
//  CustomSwitchCell.swift
//  SettingPariProgramming
//
//  Created by CLEE on 21/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

protocol CustomSwtichCellProtocol {
    func customSwitchCellDelegate(cell:CustomSwitchCell, isOn:Bool)
    
}

class CustomSwitchCell:UITableViewCell {
    
    @IBOutlet var switcher:UISwitch?
    @IBOutlet var labelforSwitcher:UILabel?
    
    var delegateForSwitcher:CustomSwtichCellProtocol?
    
    @IBAction func switchAction(_ sender:UISwitch) {
        delegateForSwitcher?.customSwitchCellDelegate(cell: self, isOn: sender.isOn)
        
    }
    
}
