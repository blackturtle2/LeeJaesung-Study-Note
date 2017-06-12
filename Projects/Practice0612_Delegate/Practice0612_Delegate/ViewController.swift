//
//  ViewController.swift
//  Practice0612_Delegate
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, confirmVeiwDelegate {
    
    @IBOutlet var customView:ConfirmView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func didSelectedYes(item: ConfirmView) {
        print("yes")
        
    }
    
    func didSelectedNo(item: ConfirmView) {
        print("no")
    }


}

