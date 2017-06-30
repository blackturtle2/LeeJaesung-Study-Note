//
//  TestViewController.swift
//  FriendList
//
//  Created by leejaesung on 2017. 6. 28..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var myPerson:Friend?
    var myFriendList:FriendList?
    
    @IBOutlet weak var labelName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendList = DataCenter.sharedInstance.dicFriendListData
        
        print(myFriendList?.dicFriendList ?? "ERROR- no data")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTest(_ sender:UIButton) {
        let testData:Friend = Friend(name: "leejaesung", gender: "Man")
        
        DataCenter.sharedInstance.saveDataOf(friend: testData)
    }

}
