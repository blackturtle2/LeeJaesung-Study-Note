//
//  ViewController.swift
//  Practice0627_StudyDataModeling
//
//  Created by leejaesung on 2017. 6. 27..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data:[Person]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
//        vData = DataCenter.sharedInstance.personList
        let vPerson = Person(name: "leejaesung", age: 1)
        UserDefaults.standard.set([vPerson], forKey: "people")
        
    }
    


}

