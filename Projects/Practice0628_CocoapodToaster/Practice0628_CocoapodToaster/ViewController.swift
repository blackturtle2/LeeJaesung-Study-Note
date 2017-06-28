//
//  ViewController.swift
//  Practice0628_CocoapodToaster
//
//  Created by leejaesung on 2017. 6. 28..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Toaster

class ViewController: UIViewController {
    
    var vToast:Toast?

    override func viewDidLoad() {
        super.viewDidLoad()
        vToast = Toast(text: "안녕하세요, 첫 토스트예요.", delay: 0, duration: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func button1action(_ sender:UIButton) {
        vToast?.show()
    }
    
    @IBAction func button2action(_ sender:UIButton) {
        vToast?.cancel() // self.view.removeFromSuperview() 이런 소스가 들어 있었다.
        
        vToast = Toast(text: "두번째 토스트예요.", delay: 0, duration: 1)
    }
    

}

