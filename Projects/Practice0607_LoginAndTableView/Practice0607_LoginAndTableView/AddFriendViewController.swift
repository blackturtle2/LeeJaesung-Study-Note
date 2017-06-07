//
//  AddFriendViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    @IBOutlet var textfieldUserInput: UITextField?
    @IBOutlet var buttonSave: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSaveAction(_ sender: UIButton) {
        var vArray = UserDefaults.standard.array(forKey: MyFriend.personInfo)
        let vDic = [MyFriend.name : textfieldUserInput?.text]
        
        if vArray == nil {
            vArray = [vDic]
        }else {
            vArray?.append(vDic)
        }
        
        UserDefaults.standard.set(vArray, forKey: MyFriend.personInfo)
        
        print(UserDefaults.standard.array(forKey: MyFriend.personInfo)!)
        
        self.navigationController?.popViewController(animated: true)
    }

}
