//
//  ViewController.swift
//  Practice0613_DelegateCustomView
//
//  Created by leejaesung on 2017. 6. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomDelegate, BottomViewDelegate {
    
    @IBOutlet var myCustomView1:CustomView?
    @IBOutlet var bottomView:BottomView?
    @IBOutlet var labelResult:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCustomView1?.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressButton() {
        let vStr:String = (labelResult?.text)!
        
        labelResult?.text = "\(vStr) *"
    }
    
    func pressResetButton() {
        labelResult?.text = "*"
    }

}

