//
//  ViewController.swift
//  Practice0629_StudyDataModeling
//
//  Created by leejaesung on 2017. 6. 29..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vAlbumData:Album?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vAlbumData = DataFile.sharedInstance.albumData
        
        print(vAlbumData?.title ?? "데이터 없음")
        print(vAlbumData?.artist ?? "데이터 없음")
        print(vAlbumData?.genre ?? "데이터 없음")
        print(vAlbumData?.songs ?? "데이터 없음")
        
        UserDefaults.standard.set(["album_title":"아이유 1집", "album_artist":"아이유", "album_genre":"iu_genre"], forKey: "albums")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

