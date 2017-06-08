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
        
        if isEdit == false {
            buttonDelete.isHidden = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if isEdit == true {
            var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo)
            var vDicData = vArrayData?[vIndexNumber!] as! [String:String]
            
            textfieldTitle?.text = vDicData[MyMemo.memoTitle]
            textviewContent?.text = vDicData[MyMemo.memoContent]
            
            buttonDelete.isHidden = false
        }
    }
    
    // 저장 버튼 액션 정의
    @IBAction func buttonSaveAction(_ sender: UIBarButtonItem) {
        
        if textfieldTitle?.text == "" {
            showAlert(vTitle: "알림", vMessage: "타이틀을 작성해주세요.")
            return
        }else if textviewContent?.text == "" {
            showAlert(vTitle: "알림", vMessage: "내용을 작성해주세요.")
            return
        }
        
        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo)
        let vDicData = [ MyMemo.memoTitle : textfieldTitle?.text , MyMemo.memoContent : textviewContent?.text ]
        
        if isEdit == false {
            if vArrayData == nil {
                vArrayData = [vDicData]
            }else {
                // vArrayData?.append(vDicData)
                vArrayData?.insert(vDicData, at: 0) // 메모를 작성하면, 리스트 최상단에 오도록 한다.
            }
        } else if isEdit == true {
            vArrayData?.remove(at: vIndexNumber!)
            vArrayData?.insert(vDicData, at: vIndexNumber!)
        }
        
        UserDefaults.standard.set(vArrayData, forKey: MyMemo.memo)
        
        // UserDefaults 검사
        print(UserDefaults.standard.array(forKey: MyMemo.memo)!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonDeleteAction(_ sender: UIButton) {
        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo)
        vArrayData?.remove(at: vIndexNumber!)
        
        UserDefaults.standard.set(vArrayData, forKey: MyMemo.memo)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // Alert 만들기
    func showAlert(vTitle: String, vMessage: String) {
        let alert:UIAlertController = UIAlertController(title: vTitle, message: vMessage, preferredStyle: .alert)
        let okButton:UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}
