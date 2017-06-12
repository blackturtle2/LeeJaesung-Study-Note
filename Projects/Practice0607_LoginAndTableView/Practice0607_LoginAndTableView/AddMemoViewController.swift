//
//  AddFriendViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {
    
    @IBOutlet weak var buttonSave: UIBarButtonItem!
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet var textfieldTitle: UITextField?
    @IBOutlet var textviewContent: UITextView?
    
    var vIndexNumber: Int?
    var isEdit: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Edit 모드로 들어왔을 경우, 삭제 버튼을 보이지 않게 합니다.
        if isEdit == false {
            buttonDelete.isHidden = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Edit 모드로 들어왔을 때, 각각의 TextField들을 채웁니다.
    override func viewWillAppear(_ animated: Bool) {
        
        if isEdit == true {
//            var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
            var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))
            var vDicData = vArrayData?[vIndexNumber!] as! [String:String]
            
            textfieldTitle?.text = vDicData[MyMemo.memoTitle]
            textviewContent?.text = vDicData[MyMemo.memoContent]
            
            buttonDelete.isHidden = false
        }
    }
    
    // MARK: 저장 버튼 액션 정의
    @IBAction func buttonSaveAction(_ sender: UIBarButtonItem) {
        
        // -- 예외처리 시작 -- //
        if textfieldTitle?.text == "" {
            showAlert(vTitle: "알림", vMessage: "타이틀을 작성해주세요.")
            return
        }else if textviewContent?.text == "" {
            showAlert(vTitle: "알림", vMessage: "내용을 작성해주세요.")
            return
        }
        // -- 예외처리 끝 -- //
        
//        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))
        let vDicData = [ MyMemo.memoTitle : textfieldTitle?.text , MyMemo.memoContent : textviewContent?.text ]
        
        if isEdit == false {
            if vArrayData == nil {
                vArrayData = [vDicData]
            }else {
                vArrayData?.insert(vDicData, at: 0) // 메모를 작성하면, 리스트 최상단에 오도록 합니다.
            }
        } else if isEdit == true {
            vArrayData?.remove(at: vIndexNumber!)
            vArrayData?.insert(vDicData, at: vIndexNumber!)
        }
        
        // UserDefaults 저장.
//        UserDefaults.standard.set(vArrayData, forKey: MyMemo.memo) // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        UserDefaults.standard.set(vArrayData, forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))
        
        // UserDefaults 검사.
        print(UserDefaults.standard.array(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))!)
        
        self.navigationController?.popViewController(animated: true) // 내비게이션 이전 단계로 이동.
    }
    
    // MARK: 삭제 버튼 액션 정의
    @IBAction func buttonDeleteAction(_ sender: UIButton) {
//        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))
        vArrayData?.remove(at: vIndexNumber!)
        
//        UserDefaults.standard.set(vArrayData, forKey: MyMemo.memo) // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        UserDefaults.standard.set(vArrayData, forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Alert 만들기
    func showAlert(vTitle: String, vMessage: String) {
        let alert:UIAlertController = UIAlertController(title: vTitle, message: vMessage, preferredStyle: .alert)
        let okButton:UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}
