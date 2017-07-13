//
//  ViewController.swift
//  Practice0713_Firebase2
//
//  Created by leejaesung on 2017. 7. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    @IBOutlet var textFieldName:UITextField!
    @IBOutlet var textFieldTitle:UITextField!
    @IBOutlet var textFieldMemo:UITextField!
    
    @IBOutlet var labelMemo:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()
        let itemsRef = ref.child("friend")
        
        itemsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let memoData = data?["person1"] as? String ?? "(no data)"
            self.labelMemo.text = memoData
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonAction(_ sender:UIButton) {
        
        let rawData = Database.database().reference().child("friend")
        rawData.setValue(["person1":"\(textFieldName.text ?? "(no data)")"])
        
    }


}

