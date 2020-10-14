//
//  MyTableViewCell.swift
//  Practice0612_CutomTableView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var albumImage:UIImageView?
    @IBOutlet var albumTitle:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
