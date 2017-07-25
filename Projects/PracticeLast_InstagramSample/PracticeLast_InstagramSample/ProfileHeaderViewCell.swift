//
//  ProfileHeaderViewCell.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 25..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ProfileHeaderViewCell: UICollectionViewCell {
    
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
    
    let horizontalStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        return stackView
    }()
    
    let editProfileBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Edit Profile", for: .normal) //Title의 Default 컬러는 흰색이다.
        btn.setTitleColor(.blue, for: .normal) // Extension을 만들어서 이렇게 해결할 수 있었다.
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(photoBtn)
        self.addSubview(horizontalStackView)
        self.addSubview(postLabel)
        self.addSubview(followersLabel)
        self.addSubview(followingLabel)
        self.addSubview(editProfileBtn)
        horizontalStackView.addArrangedSubviews([postLabel, followersLabel, followingLabel])
        
        setSubView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        horizontalStackView.anchor(top: photoBtn.topAnchor,
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
                              left: horizontalStackView.leftAnchor,
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
    }
    
    
}
