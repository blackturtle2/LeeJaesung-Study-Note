//
//  ViewController.swift
//  Practice0703_MyUICollectionView
//
//  Created by leejaesung on 2017. 7. 3..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

let reuseIdentifier:String = "myCell"

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var mainCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView?.delegate = self
        mainCollectionView?.dataSource = self
        
        mainCollectionView?.register(UINib.init(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: ***** UICollectionViewDataSource *****
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataCenter.center.originalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell:MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        myCell.labelMain?.text = DataCenter.center.nameOf(indexItem: indexPath.item)
        
        
        return myCell
    }
    
    
    // MARK: ***** UICollectionViewDelegate *****
    
    // (when the touch begins)
    // 1. -collectionView:shouldHighlightItemAtIndexPath:
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        print("shouldHighlightItemAt \(indexPath)")
        
        return true
    }
    
    // 2. -collectionView:didHighlightItemAtIndexPath: item에 touch를 시작했을 때, Highlight가 됩니다.
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("didHighlightItemAt \(indexPath)")
        
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.orange
    }
    
    
    // (when the touch lifts)
    // 3-a. -collectionView:shouldSelectItemAtIndexPath:
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("shouldSelectItemAt \(indexPath)")
        return true
    }
    
    // 3-b. -collectionView:shouldDeselectItemAtIndexPath:
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        print("shouldDeselectItemAt \(indexPath)")
        return true
    }
    
    // 4-a. -collectionView:didSelectItemAtIndexPath: item에 touch를 끝낼 때, 실행됩니다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt \(indexPath)")
        
        if collectionView.cellForItem(at: indexPath)?.backgroundColor == UIColor.black {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.clear
        }else {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.black
        }
    }
    
    // 4-b. -collectionView:didDeselectItemAtIndexPath: 다른 item을 Select하면서 원래 선택된 item이 Deselect 됩니다.
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselectItemAt \(indexPath)")
        
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.gray
    }
    
    // 5. -collectionView:didUnhighlightItemAtIndexPath:
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("didUnhighlightItemAt \(indexPath)")
    }
    
    
    

}

