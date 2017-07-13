//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by leejaesung on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet var labelSongTitle:UILabel?
    @IBOutlet var labelArtistName:UILabel?
    @IBOutlet var imageViewAlbumArt:UIImageView?
    
    @IBOutlet var buttonPlay:UIButton?
    
    private var songData:SongMetaData?
    
    var player:AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        loadUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadUI() {
        labelSongTitle?.text = songData?.songTitle
        labelArtistName?.text = songData?.artistName
        imageViewAlbumArt?.image = songData?.albumImg
        
        let fileName:String = "\(songData!.songID!)"
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            player = AVPlayer(url: url)
        }
        
        player?.play()
    }
    
    func setSong(_ aData:SongMetaData) {
        songData = aData
    }
    
    @IBAction func buttonPlayAction(_ sender: UIButton) {
        
        
        
        player?.pause()
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        let songDataList = SongDataSource()
        let nextSongID = songData!.songID! - 1
        
        songData = songDataList.cellForSongData(at: nextSongID)
        
        loadUI()
        
    }
    
    @IBAction func buttonNext(_ sender: UIButton) {
        let songDataList = SongDataSource()
        let nextSongID = songData!.songID! + 1
        
        songData = songDataList.cellForSongData(at: nextSongID)
        
        loadUI()
        
    }
    

}
