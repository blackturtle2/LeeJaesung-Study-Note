//
//  MainViewController.swift
//  LoginPageProject
//
//  Created by leejaesung on 2017. 5. 31..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // UserDefaults의 isLogin 값이 false이면, 로그인 뷰로 바로 이동합니다.
        // UserDefaults에서 Bool 값은 nil이 아니고, false입니다.
        if UserDefaults.standard.bool(forKey: Authentification.isLogin) == false {
            self.performSegue(withIdentifier: "moveLogin", sender: self)
        }
        
    }
    
    // 메인 뷰의 로그아웃 버튼을 누르면, 로그인 상태를 false라고 UserDefaults에 저장합니다.
    @IBAction func buttonLogoutAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: Authentification.isLogin)
    }
    
    
}
