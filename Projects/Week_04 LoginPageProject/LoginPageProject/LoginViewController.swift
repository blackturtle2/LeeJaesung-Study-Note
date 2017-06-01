//
//  ViewController.swift
//  LoginPageProject
//
//  Created by leejaesung on 2017. 5. 30..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldUserID: UITextField!
    @IBOutlet weak var textFieldUserPassword: UITextField!
    
    @IBOutlet weak var scrollViewRoot: UIScrollView!
    
    // 로그인 뷰로 데이터가 전달되면, 받는 용도입니다.
    var data:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로그인 뷰로 오면, 로그인이 풀렸다는 뜻이므로 isLogin 값을 false라고 줍니다.
        // 로그아웃 버튼과 겹칠 수 있지만, 안전하게 아래 명령을 넣도록 합니다. - 재성
        UserDefaults.standard.set(false, forKey: Authentification.isLogin)
        
        textFieldUserID.delegate = self
        textFieldUserPassword.delegate = self
        
        // 로그인 뷰로 데이터가 전달되면, 받아서 표시합니다.
        if data != nil {
            textFieldUserID.text = data
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// START ///
    
    // 로그인 버튼 액션 정의.
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        if !(textFieldUserID.text?.isEmpty)! {
            showDialog(title: "알림", message: "이메일을 입력해주세요.")
            return
        }else if !(textFieldUserPassword.text?.isEmpty)! {
            showDialog(title: "알림", message: "비밀번호를 입력해주세요.")
            return
        }
        
        UserDefaults.standard.set(true, forKey: Authentification.isLogin)
        performSegue(withIdentifier: "moveMain", sender: nil)

    }
    
    // 로그인 정보 기억하기 버튼 액션 정의.
    @IBAction func buttonSaveLogin(_ sender: UIButton) {
        // 내용 무.....
    }
    
    // textField에서 키보드의 Return 버튼을 눌렀을 때의 액션 정의.
    // Delegate 함수입니다.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            self.view.viewWithTag(1)?.becomeFirstResponder()
            // textFieldUserPassword.becomeFirstResponder()
            // 패스워드 텍스트필드로 커서를 이동한다.
        default:
            textField.resignFirstResponder() // 키보드를 내린다.
        }
        
        return true
    }
    
    // 다른 뷰에서 로그인 뷰로 unwind 액션을 정의합니다.
    @IBAction func unwindLoginView(segueValue:UIStoryboardSegue){
        
    }
    
    // textField에 커서가 오면, ScrollView를 올려서 키보드에 가리지 않도록 합니다.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollViewRoot.setContentOffset(CGPoint(x: 0.0, y:100.0), animated: true)
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

