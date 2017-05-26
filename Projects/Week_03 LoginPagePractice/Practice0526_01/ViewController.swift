//
//  ViewController.swift
//  Practice0526_01
//
//  Created by leejaesung on 2017. 5. 26..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldID.delegate = self
        textFieldID.tag = 0
        textFieldPassword.delegate = self
        textFieldPassword.tag = 1
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

