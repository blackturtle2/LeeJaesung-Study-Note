//
//  ViewController.swift
//  Practice0620_DatePicker_DateFormatter
//
//  Created by leejaesung on 2017. 6. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelDateStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePickerMain(_ sender: UIDatePicker) {
        let myDateFormat = DateFormatter()
        myDateFormat.dateFormat = "yyyy년 MM월 dd일 a h시 mm분"
        
        labelDateStatus.text = "\(myDateFormat.string(from: sender.date))"
        
        
    }


}

