//
//  ViewController.swift
//  Practice0529_01
//
//  Created by leejaesung on 2017. 5. 29..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfInsertID: UITextField!
    @IBOutlet weak var tfInsertPW: UITextField!
    @IBOutlet weak var svRoot: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfInsertID.delegate = self
        tfInsertPW.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        svRoot.setContentOffset(CGPoint(x:0, y:250), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        svRoot.setContentOffset(CGPoint(x:0, y:0), animated: true)
        
        return true
    }

}

