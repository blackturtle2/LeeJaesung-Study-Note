//
//  ViewController.swift
//  Practice0714_UIImageView
//
//  Created by leejaesung on 2017. 7. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string:"https://i.ytimg.com/vi/tX5jB733nd0/maxresdefault.jpg")
        let data = NSData(contentsOf: url! as URL)
        imgView.image = UIImage(data: data! as Data)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

