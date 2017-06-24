//
//  ViewController.swift
//  Practice0522
//
//  Created by leejaesung on 2017. 5. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iosStatusBarHeight: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 독일 국기
        let firstBox:UIView = UIView(frame: CGRect(x: 15, y: iosStatusBarHeight+15, width: 345, height: 60))
        firstBox.backgroundColor = UIColor.black
        self.view.addSubview(firstBox)
        
        let firstFont:UILabel = UILabel(frame: CGRect(x: 15, y: firstBox.bounds.height/2, width: 100, height: 15))
        firstFont.text = "This"
        firstFont.textColor = UIColor.white
        firstBox.addSubview(firstFont)
        
        
        let secondBox:UIView = UIView(frame: CGRect(x: 15, y: iosStatusBarHeight+60+15, width: 345, height: 60))
        secondBox.backgroundColor = UIColor.red
        self.view.addSubview(secondBox)
        
        let secondFont:UILabel = UILabel(frame: CGRect(x: 15, y: secondBox.bounds.height/2, width: 100, height: 15))
        secondFont.text = "is"
        secondBox.addSubview(secondFont)
        
        
        let thirdBox:UIView = UIView(frame: CGRect(x: 15, y: iosStatusBarHeight+120+15, width: 345, height: 60))
        thirdBox.backgroundColor = UIColor.yellow
        self.view.addSubview(thirdBox)
        
        let thirdFont:UILabel = UILabel(frame: CGRect(x: 15, y: thirdBox.bounds.height/2, width: 100, height: 15))
        thirdFont.text = "GERMANY"
        thirdBox.addSubview(thirdFont)
        
        // MARK: 이미지뷰 만들기
        let gfriendImgV = UIImageView(frame: CGRect(x: view.bounds.width-100-15, y: 250, width: 100, height: 100))
        gfriendImgV.image = UIImage(named: "gfriend.jpg")
        gfriendImgV.contentMode = UIViewContentMode.scaleAspectFit
        gfriendImgV.backgroundColor = UIColor.gray
        self.view.addSubview(gfriendImgV)
        
        let gfriendImgV_2 = UIImageView(frame: CGRect(x: view.bounds.width-100-15, y: 250+100+15, width: 100, height: 100))
        gfriendImgV_2.image = UIImage(named: "gfriend.jpg")
        gfriendImgV_2.contentMode = UIViewContentMode.scaleAspectFill
        gfriendImgV_2.backgroundColor = UIColor.gray
        self.view.addSubview(gfriendImgV_2)
        
        let gfriendImgV_3 = UIImageView(frame: CGRect(x: view.bounds.width-100-15, y: 250+100+15+100+15, width: 100, height: 100))
        gfriendImgV_3.image = UIImage(named: "gfriend.jpg")
        gfriendImgV_3.contentMode = UIViewContentMode.scaleToFill
        gfriendImgV_3.backgroundColor = UIColor.gray
        self.view.addSubview(gfriendImgV_3)
        
        // MARK: for문으로 이미지뷰 그리기.
        for i in 1...3 {
            let gfriendImgV_4 = UIImageView(frame: CGRect(x: 15, y: 180+i*100, width: 100, height: 100))
            gfriendImgV_4.image = UIImage(named: "gfriend.jpg")
            gfriendImgV_4.contentMode = .scaleToFill
            gfriendImgV_4.backgroundColor = UIColor.gray
            self.view.addSubview(gfriendImgV_4)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

