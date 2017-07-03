//
//  BasicCollectionViewCell.swift
//  Practice0703_CollectionView
//
//  Created by leejaesung on 2017. 7. 3..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class BasicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var labelTitle:UILabel?
    
    func set(title aTitle:String) {
        self.labelTitle?.text = aTitle
    }
    
}
