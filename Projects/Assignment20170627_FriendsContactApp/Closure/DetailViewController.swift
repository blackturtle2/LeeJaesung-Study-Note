//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textFieldGender: UITextField!
    @IBOutlet weak var navigationItemTitle: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonItemComplete(_ sender: UIBarButtonItem) {
        // ***** 예외 처리 시작 ***** //
        guard let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") as! [[String:String]] else { return print("예외처리") }
        // ***** 예외 처리 끝***** //
        
        
        var arrayTotalFriends = UserDefaults.standard.array(forKey: "friends") as! [[String:String]]
        let dicNewFriend:[String:String] = ["Name": textFieldName.text!, "Age": textFieldAge.text!, "Gender": textFieldGender.text!]
        
        arrayTotalFriends.append(dicNewFriend)
        
        UserDefaults.standard.set(arrayTotalFriends, forKey: "friends")
        
    }
    
    @IBAction func buttonDeleteAction(_ sender: UIButton) {
        
    }

}
