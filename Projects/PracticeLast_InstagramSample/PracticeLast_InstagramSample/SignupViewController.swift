//
//  SignupViewController.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 24..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    let photoBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Photo", for: .normal) //Title의 Default 컬러는 흰색이다.
//        btn.setTitleColor(UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1), for: .normal)
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal) // Extension을 만들어서 이렇게 해결할 수 있었다.
        btn.addTarget(self, action:#selector(actionHandle) , for: .touchUpInside)
        
//      오토레이아웃의 활성화를 위해, translatesAutoresizingMaskIntoConstraints를 false로 설정한다.
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.backgroundColor = .blue
        
        
        return btn
    }()
    // Closure로 만들고, 바로 뒤에 () 괄호를 붙여서 클로저를 만들고 바로 실행한다.
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input Email"
        tf.textAlignment = .center
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let userNameTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input User Name"
        tf.textAlignment = .center
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let passwordTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input Password"
        tf.textAlignment = .center
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let signUpBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal) //Title의 Default 컬러는 흰색이다.
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action:#selector(signUpActionHandle) , for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.backgroundColor = .blue
        
        
        return btn
    }()
    
    
    func actionHandle() {
        print("actionHandle")
        
        let secondView = LoginViewController()
        
//        self.present(secondView, animated: true) { 
//            print("present")
//        }
//        NavigationController 사용으로 주석 처리.
        
        self.show(secondView, sender: nil)
    }
    
    func signUpActionHandle() {
        print("signUpActionHandle")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "main"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: <#T##String?#>, style: <#T##UIBarButtonItemStyle#>, target: <#T##Any?#>, action: <#T##Selector?#>)
        
        
        view.addSubview(photoBtn)
        setUpSubViewLayout()
        
//        let stackView = UIStackView(arrangedSubviews: [emailTextField, userNameTextField, passwordTextField])
        let stackView = UIStackView()
        stackView.addArrangedSubviews([emailTextField, userNameTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        stackView.spacing = 8
        
        
        view.addSubview(stackView)
//        stackView.topAnchor.constraint(equalTo: photoBtn.bottomAnchor, constant: 20).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        UIView의 anchor()라는 Extension을 만들어서 아래와 같이 붙임.
        
        stackView.anchor(top: photoBtn.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, leftConstant: 16, rightConstant: 16, bottomConstant: 0, width: 0, height: 0150, centerX: nil, centerY: nil)
        
        view.addSubview(signUpBtn)
        signUpBtn.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 8, leftConstant: 8, rightConstant: 8, bottomConstant: 0, width: 0, height: 100, centerX: nil, centerY: nil)
    }
    
    fileprivate func setUpSubViewLayout() {
        //        photoBtn.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        
        // MARK: photoBtn의 Autolayout 정의.
        // NSLayoutAnchor, UIView의 Property 참고해볼 것. #Anchor
        // addSubview 한 다음에 오토레이아웃을 적용해야만 한다.
//        photoBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        photoBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        photoBtn.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        photoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // UIView의 Extension으로 아래에서 acnhor를 함수 하나로 끝내버렸다.
        
        
        photoBtn.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 40, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 120, height: 120, centerX: view.centerXAnchor, centerY: nil)
        
        photoBtn.layer.cornerRadius = 120 / 2 // 상수가 아닌, 변수로 넣을 수 있는 방법의 고민 필요.
        photoBtn.layer.borderWidth = 1
        photoBtn.layer.backgroundColor = UIColor.black.cgColor
    }
    
}
