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
        
        // 텍스트필드에서 키보드의 return 버튼 누르면, 다음 텍스트필드로 넘어가고, 그 다음에는 키보드 내리기.
        switch textField.tag {
        case 0:
            self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    // 텍스트필드에 10글자 이상 입력 불가하도록 만들기.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("range.length: \(range.length)")
        print("range.location: \(range.location)")
        print("textField.text?.characters.count: \(String(describing: textField.text?.characters.count))")
        print("string.characters.count: \(string.characters.count)")
        print("")
        
        switch textField.tag {
        case 0:
            let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
            return !(newLength > 10)
        default:
            return true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindView(segue:UIStoryboardSegue){
        
    }


}

