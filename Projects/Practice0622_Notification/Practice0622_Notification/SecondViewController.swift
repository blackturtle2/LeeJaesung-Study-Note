//
//  SecondViewController.swift
//  Practice0622_Notification
//
//  Created by leejaesung on 2017. 6. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        NotificationCenter.default.post(name: Notification.Name("postNoti"), object: sender.isOn)
        
//        if sender.isOn {
//            NotificationCenter.default.post(name: Notification.Name("postNoti"), object: sender.isOn)
//        }else {
//            NotificationCenter.default.post(name: Notification.Name("postNoti"), object: sender.isOn)
//        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
