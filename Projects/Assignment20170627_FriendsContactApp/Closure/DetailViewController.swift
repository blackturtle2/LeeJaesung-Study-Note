//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var segmentedControlGender: UISegmentedControl!
    @IBOutlet weak var navigationItemTitle: UINavigationItem!
    
    var vPerson = Person(pName: "", pGender: Gender.Man)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonItemComplete(_ sender: UIBarButtonItem) {
        // ***** 예외 처리 시작 ***** //
        // Textfield - 비어있는지 체크.
        if (textFieldName.text?.isEmpty)! || (textFieldAge.text?.isEmpty)! {
            JS_ToolBox.showOkAlert(sender: self, title: "알림", massage: "정보가 부족합니다.", handler: nil)
            return
        }
        
        vPerson.name = textFieldName.text!
//        vPerson.age = textFieldAge.text!
        vPerson.gender = Gender(rawValue: segmentedControlGender.selectedSegmentIndex)!
        
        // UserDefaults 데이터 - nil 여부 체크.
        guard let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") else {
            UserDefaults.standard.set([["Name": vPerson.name, "Age": vPerson.age!, "Gender": vPerson.gender]], forKey: "friends")
            return
        }
        // ***** 예외 처리 끝***** //
        
        var arrayTotalFriends = vArrayTotalFriends
        let dicNewFriend:[String:Any] = ["Name": vPerson.name, "Age": vPerson.age!, "Gender": vPerson.gender]
        
        arrayTotalFriends.append(dicNewFriend)
        
        UserDefaults.standard.set(arrayTotalFriends, forKey: "friends")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func buttonDeleteAction(_ sender: UIButton) {
        
    }

}
