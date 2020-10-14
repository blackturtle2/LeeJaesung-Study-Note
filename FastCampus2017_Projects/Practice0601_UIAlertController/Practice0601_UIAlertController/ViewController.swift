//
//  ViewController.swift
//  Practice0601_UIAlertController
//
//  Created by leejaesung on 2017. 6. 1..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let alert:UIAlertController = UIAlertController(title: "알림", message: "Alert입니다.", preferredStyle: .alert)
//        let okButton:UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
        
        let action:UIAlertAction = UIAlertAction(title: "",
                                                 style: .default) { (alert:UIAlertAction) in
            print("버튼을 클릭했습니다.")
        }
        
        //alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet() {
        let alert:UIAlertController = UIAlertController(title: "액션시트", message: "ActionSheet입니다.", preferredStyle: .actionSheet)
        
        self.present(alert, animated: true, completion: nil)
    }

}

