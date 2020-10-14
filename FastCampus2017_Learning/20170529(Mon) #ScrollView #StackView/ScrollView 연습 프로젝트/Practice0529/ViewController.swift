//
//  ViewController.swift
//  Practice0529
//
//  Created by leejaesung on 2017. 5. 29..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 스크롤뷰 만들기
        
        //frame은 테두리와 크기까지 잡은 것이고. bounds는 0,0이라는 좌표값만 가진 것이다? --> 둘의 차이점에 대한 재확인 필요.
        let sc:UIScrollView = UIScrollView(frame: self.view.bounds) //view.boudns: 화면을 꽉 차게 만든 것.
        sc.contentSize = CGSize(width: self.view.bounds.width * 5, height: self.view.bounds.height )
//        sc.contentInset = CGSize(width: CGFloat, height: CGFloat) // Inset은 스크롤뷰 안에 여백을 줄 때 사용한다.
        
        sc.isPagingEnabled = true
        // 페이지 넘기는 느낌을 준다.
        
        sc.bounces = true
        // 맨 끝점에서 튕기듯이 바운스한다.
        
        sc.refreshControl = UIRefreshControl.init()
        sc.refreshControl?.tintColor = .red
        // 스크롤 뷰 refreshControl 소스
        
        
        self.view.addSubview(sc)
        //self는 "ViewController"를 가리킨다. self는 명시적인 표시이고, 생략해도 괜찮다.
        
        let v1:UIView = UIView(frame: CGRect(x: self.view.bounds.width * 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height))
        v1.backgroundColor = .yellow
        sc.addSubview(v1) //sc에 콘텐츠뷰에 넣을 수 없다? 그냥 sc에 addSubview 한다.
        
        let v2:UIView = UIView(frame: CGRect(x: self.view.bounds.width * 1, y: 50, width: self.view.bounds.width, height: self.view.bounds.height))
        v2.backgroundColor = .red
        sc.addSubview(v2)
        
        let v3:UIView = UIView(frame: CGRect(x: self.view.bounds.width * 2, y: 50, width: self.view.bounds.width, height: self.view.bounds.height))
        v3.backgroundColor = UIColor.blue //타입 추론을 통해서 UIColor를 굳이 타이핑하지 않아도 된다. ~self 같은 느낌적인 느낌?~
        sc.addSubview(v3)
        
        let v4:UIImageView = UIImageView(frame: CGRect(x: self.view.bounds.width * 3, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        v4.image = #imageLiteral(resourceName: "legend_iu_03.jpeg")
        v4.contentMode = .scaleAspectFit
        sc.addSubview(v4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

