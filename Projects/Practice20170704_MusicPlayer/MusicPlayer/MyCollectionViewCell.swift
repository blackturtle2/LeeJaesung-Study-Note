//
//  MyCollectionViewCell.swift
//  MusicPlayer
//
//  Created by leejaesung on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var labelSongTitle:UILabel?
    @IBOutlet var imageViewAlbumArt:UIImageView?
    
    private var data:SongMetaData?
    
    var songData:SongMetaData? {
        return data
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSongData(_ aSongData: SongMetaData) {
        
        self.data = aSongData
        
        if let title = aSongData.songTitle {
            labelSongTitle?.text = title
        }
        
        if let img = aSongData.albumImg {
            imageViewAlbumArt?.image = img
        }
    }

}
