//
//  ViewController.swift
//  Practice0622_Notification
//
//  Created by leejaesung on 2017. 6. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelMain: UILabel!
    @IBOutlet weak var switchMain: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "rememberSwitch")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.callNoti(_:)), name: Notification.Name("postNoti"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.callResponse(_:)), name: NSNotification.Name("testNoti"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callNoti(_ sender:Notification) {
//        labelMain.text = sender.object as? String
//        labelMain.isHidden = sender.object as! Bool
        switchMain.setOn(sender.object as! Bool, animated: true)
    }
    
    func callResponse(_ sender:Notification) {
        labelMain.text = sender.object as? String
    }

}

