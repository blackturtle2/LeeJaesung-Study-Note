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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendList = DataCenter.sharedInstance.arrayFriendList
        
        myPerson = Friend(data: ["name":"leejaesung", "gender":"man"])
        myPerson?.age = "30"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTest(_ sender:UIButton) {
        
        saveFriendOf(person: myPerson!)
        
        let data = UserDefaults.standard.array(forKey: "friends")
        print(data)
        
        
    }

}
