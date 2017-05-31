//
//  RegisterViewController.swift
//  LoginPageProject
//
//  Created by leejaesung on 2017. 5. 31..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordConfirm: UITextField!
    @IBOutlet weak var textFieldNickName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 델리게이트
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        textFieldPasswordConfirm.delegate = self
        textFieldNickName.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        if !(textFieldEmail.text?.isEmpty)! && !(textFieldPassword.text?.isEmpty)! && !(textFieldNickName.text?.isEmpty)! {
            UserDefaults.standard.set(textFieldEmail.text, forKey: Authentification.email)
            UserDefaults.standard.set(textFieldPassword.text, forKey: Authentification.password)
            UserDefaults.standard.set(textFieldNickName.text, forKey: Authentification.nickname)
            
//            let strUserNickname:String = UserDefaults.standard.string(forKey: Authentification.nickname)!
//            showDialog(title: "알림", message: "\(strUserNickname)님 환영합니다-! :D")
            
            print(UserDefaults.standard.string(forKey: Authentification.email)!)
            print(UserDefaults.standard.string(forKey: Authentification.password)!)
            print(UserDefaults.standard.string(forKey: Authentification.nickname)!)
        }else {
            showDialog(title: "알림", message: "가입 정보가 불충분합니다.")
        }
    }
    
    // MARK: 확인 버튼 있는 다이얼로그 띄우는 함수
    func showDialog(title: String , message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
        
    }
    
    // 회원가입 버튼을 누르면, 로그인 뷰로 이동해서 사용자가 가입했던 이메일 주소를 자동으로 입력한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView:LoginViewController = segue.destination as! LoginViewController
        
        nextView.data = textFieldEmail.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 0...2:
            self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
}
