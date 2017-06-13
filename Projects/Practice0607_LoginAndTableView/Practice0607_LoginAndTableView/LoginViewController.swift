//
//  LoginViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldUserID: UITextField!
    @IBOutlet weak var textFieldUserPassword: UITextField!
    @IBOutlet weak var scrollViewRoot: UIScrollView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 로그인 뷰로 데이터가 전달되면, 받아서 표시합니다.
        if let userEmail = UserDefaults.standard.string(forKey: StringLogin.currentUserID) {
            textFieldUserID.text = userEmail
            UserDefaults.standard.removeObject(forKey: StringLogin.currentUserID)
        }
        
        textFieldUserPassword.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로그인 뷰로 오면, 로그인이 풀렸다는 뜻이므로 isLogin 값을 false로 줍니다.
        // 로그아웃 버튼과 겹칠 수 있지만, 안전하게 아래 명령을 넣도록 합니다.
        UserDefaults.standard.set(false, forKey: StringLogin.isLogin)
        
        textFieldUserID.delegate = self
        textFieldUserPassword.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 로그인 버튼 액션 정의.
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        // -- 예외처리 시작 -- //
        if (textFieldUserID.text?.isEmpty)! {
            showDialog(title: "알림", message: "아이디를 입력해주세요.")
            return
        }else if (textFieldUserPassword.text?.isEmpty)! {
            showDialog(title: "알림", message: "비밀번호를 입력해주세요.")
            return
        }
        // -- 예외처리 끝 -- //
        
        let userID = textFieldUserID.text
        let userPW = textFieldUserPassword.text
        let vArrayTotalUser = UserDefaults.standard.array(forKey: StringLogin.user)
        var availableLogin:Bool = false
        
        // 회원 목록이 0일 때 예외처리
        if UserDefaults.standard.array(forKey: StringLogin.user) == nil {
            showDialog(title: "알림", message: "회원가입이 필요합니다.")
            return
        }
        
        // 로그인 가능 여부 검사
        for i in 0...((vArrayTotalUser?.count)! - 1) {
            var vID:[String:String] = vArrayTotalUser?[i] as! [String:String]
            
            if vID[StringLogin.id] == userID {
                if vID[StringLogin.password] == userPW {
                    availableLogin = true
                    print("로그인 조건: All OK-! :D")
                }else {
                    showDialog(title: "알림", message: "비밀번호가 틀렸습니다.\r다시 확인해주세요.")
                    print("로그인 조건: Password is not okay! :(")
                    return
                }
            }
        }
        
        // 로그인 로직 처리
        if availableLogin {
            UserDefaults.standard.set(true, forKey: StringLogin.isLogin) // 로그인 여부 저장.
            UserDefaults.standard.set(userID, forKey: StringLogin.currentUserID) // currentUserID 저장.
            performSegue(withIdentifier: "moveMain", sender: nil)
            
        }else {
            showDialog(title: "알림", message: "회원 정보가 없습니다.\r회원가입을 진행해주세요.")
        }
        
    }
    
    // textField에서 키보드의 Return 버튼을 눌렀을 때의 액션 정의.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            self.view.viewWithTag(1)?.becomeFirstResponder()
            // textFieldUserPassword.becomeFirstResponder()
            // 패스워드 텍스트필드로 커서를 이동한다.
        default:
            textField.resignFirstResponder() // 키보드를 내립니다.
        }
        
        return true
    }
    
    
    // textField에 커서가 오면, ScrollView를 올려서 키보드에 가리지 않도록 합니다.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollViewRoot.setContentOffset(CGPoint(x: 0.0, y:50.0), animated: true)
    }
    
    
    // textField 에서 커서가 빠지면, ScrollView를 내려서 원상복귀 합니다.
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollViewRoot.setContentOffset(CGPoint(x: 0.0, y:0.0), animated: true)
    }
    
    
    // MARK: 확인 버튼 있는 다이얼로그 띄우는 함수
    func showDialog(title: String , message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
        
    }
    
}
