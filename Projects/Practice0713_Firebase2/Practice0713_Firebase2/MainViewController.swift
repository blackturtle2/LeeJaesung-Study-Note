//
//  ViewController.swift
//  Practice0713_Firebase2
//
//  Created by leejaesung on 2017. 7. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Firebase
import Toaster

let userKey:String = "savedUserName"

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textFieldName:UITextField!
    @IBOutlet var textFieldTitle:UITextField!
    @IBOutlet var textFieldMemo:UITextField!
    
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelTitle:UILabel!
    @IBOutlet var labelMemo:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.string(forKey: userKey) {
            textFieldName.text = data
        }
        
        loadDataFireBase()
        
        // Firebase Test
//        let ref = Database.database().reference()
//        let itemsRef = ref.child("friend")
//        
//        itemsRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            let data = snapshot.value as? NSDictionary
//            let memoData = data?["person1"] as? String ?? "(no data)"
//            self.labelMemo.text = memoData
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func loadDataFireBase() {
        let rawMemoData = Database.database().reference().child("memoDataOf\(textFieldName.text!)")
        rawMemoData.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as? NSDictionary
            self.labelName.text = data?["name"] as? String ?? "(no data)"
            self.labelTitle.text = data?["title"] as? String ?? "(no data)"
            self.labelMemo.text = data?["memo"] as? String ?? "(no data)"
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func saveButtonAction(_ sender:UIButton) {
        
        if textFieldName.text == "" {
            let toast = Toast(text: "Insert Name Please -")
            toast.show()
            return
        }
        
        UserDefaults.standard.set(textFieldName.text, forKey: userKey)
        
        let rawMemoData = Database.database().reference().child("memoDataOf\(textFieldName.text!)")
        rawMemoData.setValue(["name":textFieldName.text, "title":textFieldTitle.text, "memo":textFieldMemo.text])
        
        keyboardResponder()
        
        // Firebase Test
//        let rawData = Database.database().reference().child("friend")
//        rawData.setValue(["person1":"\(textFieldName.text ?? "(no data)")"])
        
    }
    
    @IBAction func reloadButtonAction(_ sender:UIButton) {
        keyboardResponder()
        loadDataFireBase()
    }
    
    func keyboardResponder() {
        textFieldName.resignFirstResponder()
        textFieldTitle.resignFirstResponder()
        textFieldMemo.resignFirstResponder()
    }


}

