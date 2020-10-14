//
//  ViewController.swift
//  DainingPractice
//
//  Created by 김태형 on 2017. 6. 15..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellSaveText {
    
    func notiTextField(){
        print("FirstViewController notiTextField()")
    }


    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var moneytextField: UITextField!
    @IBOutlet weak var mainTableview: UITableView!
    var count:Double = 1
    var userNameArray:Array<String> = []
    
    var dicCellTextSave:[Int:String] = Dictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        userNameArray.append(textField.text!)
//        
//        print(userNameArray)
//        
//        return true
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(count)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomFirstCell
        
//        myCell.myTextfield.delegate = self
        
        myCell.delegate = self
        
        return myCell
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
       
        count = sender.value
        tv.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
    @IBAction func goButtonTouched(_ sender: UIButton) {
//        let myCell = tv.dequeueReusableCell(withIdentifier: "cell") as! CustomFirstCell
//        var userNameArray:Array<String> = []
//        userNameArray.append(myCell.myTextfield.text!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! SecondViewController
        
        nextView.cellCount = count
        nextView.userNameArray2 = userNameArray
        nextView.money = Double(moneytextField.text!)
        
    }

}

