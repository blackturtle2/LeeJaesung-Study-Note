//
//  ViewController.swift
//  Practice0609_CustomView
//
//  Created by leejaesung on 2017. 6. 9..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rbt = RoundButton.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        rbt.backgroundColor = UIColor.black
        
//        self.view.subviews // --> [UIView]
        
        self.view.insertSubview(rbt, at: 0)
        
//        self.view.addSubview(rbt)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

