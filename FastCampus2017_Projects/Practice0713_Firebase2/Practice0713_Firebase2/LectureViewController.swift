//
//  LectureViewController.swift
//  Practice0713_Firebase2
//
//  Created by leejaesung on 2017. 7. 15..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Firebase

class LectureViewController: UIViewController {
    
    // 특강 수업에 따라서 만든 뷰
    
    @IBOutlet var textFieldKey:UITextField!
    @IBOutlet var textFieldValue:UITextField!
    
    @IBOutlet var textFieldDeleteKey:UITextField!
    
    var ref:DatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
//        ref.child("AAA/BBB/CCC").child("DDD")
        
        ref.child("kkk").observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot.value ?? "error")
        }
        
        ref.observe(.childAdded, with: { (snapshot) in
            print("Item Added \(Date())")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonSave(_ sender:UIButton) {
        let itemRef = ref.child((textFieldKey.text?.lowercased())!)
        itemRef.setValue(textFieldValue.text)
    }
    
    @IBAction func buttonDelete(_ sender:UIButton) {
        let itemRef = ref.child((textFieldDeleteKey.text)!)
        itemRef.removeValue()
        
    }

}
