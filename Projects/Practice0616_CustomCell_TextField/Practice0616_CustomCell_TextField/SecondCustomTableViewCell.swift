//
//  SecondCustomTableViewCell.swift
//  Practice0616_CustomCell_TextField
//
//  Created by leejaesung on 2017. 6. 16..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {
    
    @IBOutlet var labelLeftName:UILabel?
    @IBOutlet var labelRightMoney:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
