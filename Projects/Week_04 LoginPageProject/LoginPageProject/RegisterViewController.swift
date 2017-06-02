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
                
                if UserDefaults.standard.object(forKey: Authentification.totalUserKeyID) != nil {
                    userKeyID = 1
                }else {
                    userKeyID = UserDefaults.standard.integer(forKey: Authentification.totalUserKeyID) + 1
                }
                
                
                var userEmail = UserDefaults.standard.dictionary(forKey: Authentification.email)
                userEmail?[textFieldEmail.text!] = userKeyID
                UserDefaults.standard.set(userEmail, forKey: Authentification.email)
                
                var userPassword = UserDefaults.standard.dictionary(forKey: Authentification.password)
                userPassword?[textFieldPassword.text!] = userKeyID
                UserDefaults.standard.set(userPassword, forKey: Authentification.password)
                
                var userNickName = UserDefaults.standard.dictionary(forKey: Authentification.nickname)
                userNickName?[textFieldNickName.text!] = userKeyID
                UserDefaults.standard.set(userNickName, forKey: Authentification.nickname)
                
                //              print("\(UserDefaults.standard.array(forKey: Authentification.email)!) / \(UserDefaults.standard.array(forKey: Authentification.password)!) / \(UserDefaults.standard.array(forKey: Authentification.nickname)!)")
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
