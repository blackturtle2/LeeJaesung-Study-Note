//
//  BasicCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class BasicCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var titleLb:UILabel!
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var myIndicator:UIActivityIndicatorView!
    
    override func awakeFromNib() {
        let bgView = UIView()
        bgView.backgroundColor = .orange
        
        self.selectedBackgroundView = bgView
    }
    
    /**************/
    //Use Step1~ Step5
    func set(title:String)
    {
        self.titleLb.text = title
    }
    
    func set(image:UIImage)
    {
        imgView.image = image
    }
    /****************/
    
    
    
    //Make Step6
    /*
        타이틀과 이미지 셋팅하기
        디스패치 큐 사용해서 비동기 이미지 다운로드 하기
         <추가 기능 구현>
        *이미지 로딩전까지 디폴트 파일 배치
        *인디케이터 추가해보기
    */
    func set(title:String, imageUrl:String)  {
        var realData:Data!
        
        self.titleLb.text = title
        self.imgView.image = #imageLiteral(resourceName: "defaultImg")
        
        DispatchQueue.global(qos: .default).async {
            if let url = URL(string: imageUrl)
            {
                do{
                    realData =  try Data(contentsOf: url)
//                    self.imgView.image = UIImage(data: realData)
                    
                    DispatchQueue.main.async {
                        self.myIndicator.isHidden = true
                        self.imgView.image = UIImage(data: realData)
                    }
                    
                    print("/***loaded imag \(title) ***/")
                }catch
                {
                    
                }
            }
        }
    }
    
}
