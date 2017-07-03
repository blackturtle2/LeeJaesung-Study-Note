//
//  MyCollectionViewCell.swift
//  Practice0703_MyUICollectionView
//
//  Created by leejaesung on 2017. 7. 3..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var labelMain:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        labelMain?.text = "test"
    }

}
