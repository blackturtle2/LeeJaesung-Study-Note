//
//  MainViewController.swift
//  MusicPlayer
//
//  Created by leejaesung on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

let cellIdentifier:String = "myCell"


class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var mainCoverFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet var mainCollectionView: UICollectionView!
    
    let dataSource = SongDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView?.delegate = self
        mainCollectionView?.dataSource = self
//        mainCollectionView?.prefetchDataSource = self
        
        
        let insetSide = mainCollectionView.bounds.size.width / 4
        mainCoverFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: insetSide, bottom: 0, right: insetSide)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell:MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MyCollectionViewCell
        let vSongMetaData = dataSource.cellForSongData(at: indexPath.item)
        
        myCell.setSongData(vSongMetaData!)
        
//        myCell.labelSongTitle?.text = vSongMetaData?.albumName
//        myCell.imageViewAlbumArt?.image = vSongMetaData?.albumImg
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / 2
        let height = collectionView.bounds.size.height / 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let nextvc:PlayerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController {
            let myCell:MyCollectionViewCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell

            nextvc.setSong(myCell.songData!)
            
            self.navigationController?.pushViewController(nextvc, animated: true)
        }
        
    }
    
}
