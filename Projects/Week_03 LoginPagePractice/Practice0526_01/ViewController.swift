//
//  ViewController.swift
//  Practice0526_01
//
//  Created by leejaesung on 2017. 5. 26..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //@IBOutlet weak var textFieldID: UITextField!
    //@IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldID.delegate = self
        textFieldID.tag = 0
        textFieldPassword.delegate = self
        textFieldPassword.tag = 1
        
    }
    
    // 패스워드 텍스트필드에 패스워드 형태 추가해보기.
    // 글자수 제한 추가해보기.
    // 버튼 누르면, 뷰 이동하는 것 해보기.
    // ID 텍스트필드에 이메일 형태 체크해보기?
    
    // 이미지뷰에서 일정 시간 후에 이미지를 바꾸는게 가능할까?
    
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

