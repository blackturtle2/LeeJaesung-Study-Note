//
//  LoginViewController.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 24..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Firebase

import Toaster


class LoginViewController: UIViewController {
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Input Email"
        tf.textAlignment = .center
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let passwordTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Input Password"
        tf.textAlignment = .center
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(changedLoginBtnStatus), for: .editingChanged)
        
        return tf
    }()
    
    let loginBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action:#selector(loginBtnAction) , for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgbColor(149, 204, 244)
        btn.isEnabled = false
        
        return btn
    }()
    
    let signupBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action:#selector(signUpActionHandle) , for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgbColor(149, 204, 244)
        
        return btn
    }()
    
    func loginBtnAction() {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                let myToast = Toast.init(text: "로그인 실패입니다.")
                myToast.show()
                
                return
            }
            
            print("user: ", user ?? "(no data)")
            print("user.uid: ", user?.uid ?? "(no data)")
            print("error: ", error ?? "(no data)")
            
            Toast.init(text: "로그인 성공입니다.").show()
            
            DispatchQueue.main.async {
//                self.present(MainTabbarViewController(), animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            Database.database().reference().child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                print("///// snapshot.value: ", snapshot.value ?? "")
            }, withCancel: { (error) in
                print("///// error: ", error)
            })
            
        }
    }
    
    
    func changedLoginBtnStatus() {
        loginBtn.isEnabled = true
        loginBtn.backgroundColor = UIColor.rgbColor(17, 154, 237)
    }
    
    func signUpActionHandle() {
        self.navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signupBtn)
        
        emailTextField.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, bottom: nil, topConstant: 116, leftConstant: 16, rightConstant: 16, bottomConstant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
        
        passwordTextField.anchor(top: emailTextField.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, bottom: nil, topConstant: 16, leftConstant: 16, rightConstant: 16, bottomConstant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
        
        loginBtn.anchor(top: passwordTextField.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, bottom: nil, topConstant: 16, leftConstant: 16, rightConstant: 16, bottomConstant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
        
        signupBtn.anchor(top: loginBtn.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, bottom: nil, topConstant: 32, leftConstant: 16, rightConstant: 16, bottomConstant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
    }
    
    
}
