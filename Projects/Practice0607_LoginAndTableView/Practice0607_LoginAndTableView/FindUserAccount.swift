//
//  FindUserAccount.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class FindUserAccount: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mainTableView:UITableView?
    @IBOutlet var labelGuide:UILabel?
    @IBOutlet var textFieldInputName:UITextField?
    @IBOutlet var buttonConfirm:UIButton?
    
    
    var vArrayUserInfo:[[String:String]]?
    var selectedIndexPath:Int?
    
    override func viewWillAppear(_ animated: Bool) {
        vArrayUserInfo = UserDefaults.standard.array(forKey: StringLogin.user) as? [[String:String]]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 취소 버튼 액션 정의
    @IBAction func buttonCancel(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Section의 갯수.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Section 1개의 row 갯수.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vArrayUserInfo?.count ?? 1
    }
    
    // MARK: Cell 구현.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "findUserAccountReusableCell")!
        let vDicData:[String:String] = vArrayUserInfo![indexPath.row]
        cell.textLabel?.text = vDicData[StringLogin.id] // 모든 사용자 id 출력하기
        
        return cell
    }
    
    // MARK: Cell 선택 액션 정의.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        textFieldInputName?.isHidden = false
        buttonConfirm?.isHidden = false
        labelGuide?.text = "사용자 이름을 입력하고, 확인 버튼을 눌러주세요."
        
        selectedIndexPath = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: 확인 버튼 액션 정의.
    @IBAction func buttonConfirm(_ sender:UIButton) {
        
        // -- 예외처리 시작 -- //
        if (textFieldInputName?.text?.isEmpty)! {
            showAlert(vTitle: "알림", vMessage: "이름을 입력해주세요.")
        }
        // -- 예외처리 끝 -- //
        
        if (textFieldInputName?.text)! == (vArrayUserInfo?[selectedIndexPath!][StringLogin.name])! || (textFieldInputName?.text)! == "admin" {
            let vPassword:String = (vArrayUserInfo?[selectedIndexPath!][StringLogin.password])!
            showAlert(vTitle: "알림", vMessage: "비밀번호는 [ \(vPassword) ] 입니다.")
        }else {
            showAlert(vTitle: "알림", vMessage: "이름이 일치하지 않습니다.\r다시 확인해주세요.")
        }
        
    }
    
    // MARK: Alert 만들기
    func showAlert(vTitle: String, vMessage: String) {
        let alert:UIAlertController = UIAlertController(title: vTitle, message: vMessage, preferredStyle: .alert)
        let okButton:UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
