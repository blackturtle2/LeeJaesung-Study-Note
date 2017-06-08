//
//  DetailViewController.swift
//  MemoPairProgramming
//
//  Created by leejaesung on 2017. 6. 8..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextView!

    var vTitle:String = ""
    var vContents:String = ""
    var isEditingMode:Bool = false
    var dInt:Int?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonTouched(_ sender: UIButton) {
//        let title2 = [Need.title:titleTextField.text]
//        let contents2 = [Need.contents:contentsTextField.text]
//        
//        var title = UserDefaults.standard.array(forKey: Need.title) ?? []
//        var contents = UserDefaults.standard.array(forKey: Need.contents) ?? []
        
//        title.append(title2)
//        contents.append(contents2)
        
//        UserDefaults.standard.set(title, forKey: Need.title)
//        UserDefaults.standard.set(contents, forKey: Need.contents)
        if isEditingMode == false{
            var vArrayMemoData = UserDefaults.standard.array(forKey: Need.memo) ?? []
            
            let memoData = [Need.title : titleTextField.text, Need.contents : contentsTextField.text ]
            
            vArrayMemoData.append(memoData)
            
            UserDefaults.standard.set(vArrayMemoData, forKey: Need.memo)
            
        }else{
            var vAarrayMemoData = UserDefaults.standard.array(forKey: Need.memo) ?? []
            
            
            
//            vAarrayMemoData.remove(at: dInt!)
            
            let memoData = [Need.title : titleTextField.text, Need.contents : contentsTextField.text ]
            
            vAarrayMemoData[dInt!] = memoData
            
//            vAarrayMemoData.insert(memoData, at: dInt!)
            
            
            UserDefaults.standard.set(vAarrayMemoData, forKey: Need.memo)
            
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextField?.text = vTitle
        contentsTextField?.text = vContents
    }

}


