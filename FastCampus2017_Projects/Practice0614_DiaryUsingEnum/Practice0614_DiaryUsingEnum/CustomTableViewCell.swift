//
//  customTableViewCell.swift
//  Practice0614_DiaryUsingEnum
//
//  Created by leejaesung on 2017. 6. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var textViewContents:UITextView?
    @IBOutlet var labelDate:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
