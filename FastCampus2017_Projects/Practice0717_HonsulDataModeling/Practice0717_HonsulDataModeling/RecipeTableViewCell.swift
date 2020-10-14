//
//  RecipeTableViewCell.swift
//  Practice0717_HonsulDataModeling
//
//  Created by leejaesung on 2017. 7. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet var imageViewMain:UIImageView!
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelShortDescription:UILabel!
    @IBOutlet var buttonMoveDetail:UIButton!
    
    var cellIndexPathRow:Int!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonMoveDetailAction(_ Sender:UIButton) {
        print(buttonMoveDetail.tag)
    }

}
