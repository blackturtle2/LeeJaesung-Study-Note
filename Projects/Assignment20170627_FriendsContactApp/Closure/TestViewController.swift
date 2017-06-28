//
//  TestViewController.swift
//  FriendList
//
//  Created by leejaesung on 2017. 6. 28..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var myPerson:Person?
    var myFriendList:FriendsList?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myPerson = Person(pName: "Kimsehwa", pGender: .Woman)
        myPerson?.age = 31
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTest(_ sender:UIButton) {
        myFriendList?.saveFriend(person: myPerson!)
        
        print(UserDefaults.standard.array(forKey: "friends"))
        
        print(myFriendList?.getFriendNameOf(index: 0))
        
        
    }

}
