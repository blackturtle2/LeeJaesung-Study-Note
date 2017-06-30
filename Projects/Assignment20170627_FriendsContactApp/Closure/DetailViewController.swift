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
    
    var newFriend:Friend?
    

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
        // ***** 예외 처리 끝***** //
        
        
        var tempGender:String = "Man"
        
        switch segmentedControlGender.selectedSegmentIndex {
        case 0:
            tempGender = "Man"
        case 1:
            tempGender = "Woman"
        case 2:
            tempGender = "Unknown"
        default:
            tempGender = "Man"
        }
        
        newFriend = Friend(name: textFieldName.text!, gender: tempGender)
        newFriend?.age = Int(textFieldAge.text!)
        
        DataCenter.sharedInstance.saveDataOf(friend: newFriend!)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func buttonDeleteAction(_ sender: UIButton) {
        
    }

}
