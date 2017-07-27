//
//  ProfileHeaderViewCell.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 25..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import SDWebImage


class ProfileHeaderViewCell: UICollectionViewCell {
    
    var userData:User?{
        didSet{
            // MARK: Show userName
            userNameLabel.text = userData?.userName
            
            // MARK: Show user profile image
            if let urlStr = userData?.userProfileImgUrl, let url = URL(string: urlStr) {
                print("///// urlStr: ", urlStr)
                print("///// url: ", url)
                
                self.photoBtn.sd_setBackgroundImage(with: url, for: .normal)
                
//                SDWebImage 오픈소스 사용하게 되면서 아래 소스는 주석 처리. ( 로직은 동일 )
//                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//                    print("///// data: ", data ?? "")
//                    print("///// response: ", response ?? "")
//                    print("///// error: ", error ?? "")
//                    
////                    guard let error = error else { return } //에러가 nil인데도 return 먹음.
//                    guard let realData = data else { return }
//                    
//                    print("///// realData: ",realData)
//                    
//                    DispatchQueue.main.async {
//                        self.photoBtn.setBackgroundImage(UIImage(data: realData), for: .normal)
//                        
//                    }
//                    
//                }).resume()
            }
            
            
        }
    }
    
    
    let photoBtn:UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.blue, for: .normal) // Extension을 만들어서 이렇게 해결할 수 있었다.
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        
        return btn
    }()
    
    let postLabel:UILabel = {
        let label = UILabel()
        let labelStr = NSMutableAttributedString(string: "11\r", attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)])
        labelStr.append(NSAttributedString(string: "posts", attributes: [NSForegroundColorAttributeName : UIColor.lightGray, NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]))
        
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.attributedText = labelStr
        
        return label
    }()
    
    let followersLabel:UILabel = {
        let label = UILabel()
        let labelStr = NSMutableAttributedString(string: "11\r", attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)])
        labelStr.append(NSAttributedString(string: "followers", attributes: [NSForegroundColorAttributeName : UIColor.lightGray, NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]))
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.attributedText = labelStr
        
        return label
    }()
    
    let followingLabel:UILabel = {
        let label = UILabel()
        let labelStr = NSMutableAttributedString(string: "11\r", attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)])
        labelStr.append(NSAttributedString(string: "following", attributes: [NSForegroundColorAttributeName : UIColor.lightGray, NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]))
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.attributedText = labelStr
        
        return label
    }()
    
    let postFollowerFollowingStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        return stackView
    }()
    
    let editProfileBtn:UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.setTitle("Edit Profile", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderWidth = 1
        btn.addTarget(self, action:#selector(testFunction) , for: .touchUpInside)
        
        return btn
    }()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.text = "testest"
//        let labelStr = NSMutableAttributedString(string: "userName", attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)])
//        
//        
//        label.attributedText = labelStr
        
        return label
    }()
    
    let moveViewActionStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        return stackView
    }()
    
    let gridBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(#imageLiteral(resourceName: "grid"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action:#selector(testFunction) , for: .touchUpInside)
        
        return btn
    }()
    
    
    func testFunction() {
        print("testestest")
    }
    
    let listBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(#imageLiteral(resourceName: "list"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let bookmarkBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    
    // MARK: ***** init() *****
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(photoBtn)
        self.addSubview(postFollowerFollowingStackView)
        self.addSubview(postLabel)
        self.addSubview(followersLabel)
        self.addSubview(followingLabel)
        postFollowerFollowingStackView.addArrangedSubviews([postLabel, followersLabel, followingLabel])
        self.addSubview(editProfileBtn)
        self.addSubview(userNameLabel)
        self.addSubview(moveViewActionStackView)
        moveViewActionStackView.addArrangedSubviews([gridBtn, listBtn, bookmarkBtn])
        
        setSubView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: ***** setSubView() *****
    func setSubView() {
        photoBtn.anchor(top: self.topAnchor,
                        left: self.leftAnchor,
                        right: nil,
                        bottom: nil,
                        topConstant: 32,
                        leftConstant: 16,
                        rightConstant: 0,
                        bottomConstant: 0,
                        width: 100,
                        height: 100,
                        centerX: nil,
                        centerY: nil)
        
        postFollowerFollowingStackView.anchor(top: photoBtn.topAnchor,
                                   left: photoBtn.rightAnchor,
                                   right: self.rightAnchor,
                                   bottom: nil, 
                                   topConstant: 8, 
                                   leftConstant: 16, 
                                   rightConstant: 16, 
                                   bottomConstant: 0, 
                                   width: 0, 
                                   height: 0, 
                                   centerX: nil, 
                                   centerY: nil)
        
        editProfileBtn.anchor(top: nil,
                              left: postFollowerFollowingStackView.leftAnchor,
                              right: self.rightAnchor,
                              bottom: photoBtn.bottomAnchor,
                              topConstant: 0,
                              leftConstant: 16,
                              rightConstant: 16,
                              bottomConstant: 0,
                              width: 0,
                              height: 0,
                              centerX: nil,
                              centerY: nil)
        
        userNameLabel.anchor(top: editProfileBtn.bottomAnchor,
                             left: self.leftAnchor,
                             right: self.rightAnchor,
                             bottom: nil,
                             topConstant: 16, leftConstant: 16, rightConstant: 16, bottomConstant: 0,
                             width: 0, height: 25,
                             centerX: nil, centerY: nil)
        
        moveViewActionStackView.anchor(top: photoBtn.bottomAnchor,
                                       left: self.leftAnchor,
                                       right: self.rightAnchor,
                                       bottom: nil,
                                       topConstant: 75,
                                       leftConstant: 8,
                                       rightConstant: 8,
                                       bottomConstant: 0,
                                       width: 0,
                                       height: 0,
                                       centerX: nil,
                                       centerY: nil)
        
    }
    
    
}
