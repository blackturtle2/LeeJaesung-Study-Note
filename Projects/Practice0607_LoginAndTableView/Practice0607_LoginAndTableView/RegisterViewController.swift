//
//  RegisterViewController.swift
//  LoginPageProject
//
//  Created by leejaesung on 2017. 5. 31..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordConfirm: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldID.delegate = self
        textFieldPassword.delegate = self
        textFieldPasswordConfirm.delegate = self
        textFieldName.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 회원가입 버튼 액션 정의
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        // -- 예외처리 시작 -- //
        if (textFieldID.text?.isEmpty)! || (textFieldPassword.text?.isEmpty)! || (textFieldName.text?.isEmpty)! {
            showDialog(title: "알림", message: "회원가입 정보가 충분하지 않습니다.\r다시 확인해주세요.")
            return
        }
        
        if textFieldPassword.text != textFieldPasswordConfirm.text {
            showDialog(title: "알림", message: "비밀번호가 일치하지 않습니다.\r다시 확인해주세요.")
            return
        }
        // -- 예외처리 끝 -- //
        
        let userID = textFieldID.text
        let userPassword = textFieldPassword.text
        let userName = textFieldName.text
        var vArrayTotalUserData:[[String:String]]?
        
        
        if UserDefaults.standard.array(forKey: StringLogin.user) == nil {
            vArrayTotalUserData = [[StringLogin.id:userID!, StringLogin.password:userPassword!, StringLogin.name:userName!]]
        }else {
            vArrayTotalUserData = UserDefaults.standard.array(forKey: StringLogin.user) as? [[String : String]]
            vArrayTotalUserData!.append([StringLogin.id:userID!, StringLogin.password:userPassword!, StringLogin.name:userName!])
        }
        
        UserDefaults.standard.set(vArrayTotalUserData, forKey: StringLogin.user)
        UserDefaults.standard.set(userID, forKey: StringLogin.currentUserID)
        
        self.dismiss(animated: true, completion: nil)
        
//        test print
        for i in 0...(vArrayTotalUserData!.endIndex-1) {
            print("회원 \(i): \(vArrayTotalUserData![i])")
        }
        
    }
    
    //MARK: 취소 버튼 액션 정의
    @IBAction func buttonCancel(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: 텍스트필드에서 엔터 버튼 눌렀을 때의 delegate 액션 정의.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 0...2:
            self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    // MARK: 확인 버튼 다이얼로그 액션 정의
    func showDialog(title: String , message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
        
    }
}
