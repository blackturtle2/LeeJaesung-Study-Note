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
            
            if textFieldPassword.text == textFieldPasswordConfirm.text {
                var userKeyID:Int?
                var userEmail:[String:Any]?
                
                if UserDefaults.standard.object(forKey: StringLogin.totalUserKeyID) != nil {
                    userKeyID = 1
                }else {
                    userKeyID = UserDefaults.standard.integer(forKey: StringLogin.totalUserKeyID) + 1
                }
                
                if UserDefaults.standard.dictionary(forKey: StringLogin.email) == nil {
                    print("nil 값입니다.")
                }
                
                
                
                if UserDefaults.standard.dictionary(forKey: StringLogin.email) == nil {
                    UserDefaults.standard.set(userEmail, forKey: StringLogin.email)
                }else {
                    userEmail = UserDefaults.standard.dictionary(forKey: StringLogin.email)
                    userEmail?[textFieldEmail.text!] = userKeyID
                    UserDefaults.standard.set(userEmail, forKey: StringLogin.email)
                }
                
                
                var userPassword = UserDefaults.standard.dictionary(forKey: StringLogin.password)
                userPassword?[textFieldPassword.text!] = userKeyID
                UserDefaults.standard.set(userPassword, forKey: StringLogin.password)
                
                var userNickName = UserDefaults.standard.dictionary(forKey: StringLogin.name)
                userNickName?[textFieldNickName.text!] = userKeyID
                UserDefaults.standard.set(userNickName, forKey: StringLogin.name)
                
                //              print("\(UserDefaults.standard.array(forKey: StringLogin.email)!)
                // (UserDefaults.standard.array(forKey: StringLogin.password)!)
                // (UserDefaults.standard.array(forKey: StringLogin.nickname)!)")
            }
        }
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
