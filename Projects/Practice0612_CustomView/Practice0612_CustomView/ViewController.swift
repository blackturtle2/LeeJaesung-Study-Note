//
//  ViewController.swift
//  Practice0612_CustomView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VendingViewDelegate {
    
    @IBOutlet var circle1:CircleView?
    @IBOutlet var circle2:CircleView?
    @IBOutlet var vendingView:VendingMachineView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        circle1?.setTitleText("첫번째")
        circle2?.setTitleText("두번째")

        vendingView?.setImageView(fileName: "iu_background_12.jpg")
        vendingView?.delegate = self
    }
    
    func didSelected(item: VendingMachineView) {
        item.vLabel?.text = "IU Forever"
    }
    
    func isAbleToTouch() -> Bool {
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

