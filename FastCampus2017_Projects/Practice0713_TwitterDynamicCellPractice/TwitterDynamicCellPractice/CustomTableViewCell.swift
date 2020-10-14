//
//  CustomTableViewCell.swift
//  TwitterDynamicCellPractice
//
//  Created by leejaesung on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    //user_id
    //user_name
    //user_profile_img_url
    //body_text
    //img_url
    
    @IBOutlet var labelUserId:UILabel!
    @IBOutlet var labelUserName:UILabel!
    @IBOutlet var labelBodyText:UILabel!
    @IBOutlet var imageViewUserProfileImgUrl:UIImageView!
    @IBOutlet var imageViewContent:UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
