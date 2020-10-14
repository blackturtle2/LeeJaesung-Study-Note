//
//  SecondViewController.swift
//  Practice0622_Notification
//
//  Created by leejaesung on 2017. 6. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var a:Int = 0
    @IBOutlet var switchSpecial:UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchSpecial?.isOn = UserDefaults.standard.bool(forKey: "rememberSwitch")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "rememberSwitch")
        NotificationCenter.default.post(name: Notification.Name("postNoti"), object: sender.isOn)
    }
    
    @IBAction func plusButtonAction(_ sender: UIButton) {
        a += 1
        NotificationCenter.default.post(name: NSNotification.Name("testNoti"), object: String(a))
    }
    
    @IBAction func minusButtonAction(_ sender: UIButton) {
        a -= 1
        NotificationCenter.default.post(name: NSNotification.Name("testNoti"), object: String(a))
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
