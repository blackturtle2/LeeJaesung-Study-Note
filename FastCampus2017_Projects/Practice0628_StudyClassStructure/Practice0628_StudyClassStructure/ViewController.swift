//
//  ViewController.swift
//  Practice0628_StudyClassStructure
//
//  Created by leejaesung on 2017. 6. 28..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var textFieldMoney: UITextField!
    @IBOutlet weak var segCurrency: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonResult(_ sender: UIButton) {
        
        
        guard let sourceCurrency = Currency(rawValue: segCurrency.selectedSegmentIndex) else { return print("ERROR-") }
        guard let sourceAmount = Double(textFieldMoney.text!) else { return print("ERROR- Money") }
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
//        let ratio: Double
//        
//        switch segCurrency.selectedSegmentIndex {
//        case 0:
//            ratio = 0.1
//        case 1:
//            ratio = 0.2
//        case 2:
//            ratio = 0.3
//        case 3:
//            ratio = 0.4
//        default:
//            ratio = 1
//        }
        
//        let strTargetMoney:String
//        if let sourceMoney = Double(textFieldMoney.text!) {
//            strTargetMoney = "\(sourceMoney * ratio)"
//        }else {
//            strTargetMoney = "ERROR-"
//        }
        
        var strTargetMoney:String = ""
        
        for i in 0...3 {
            strTargetMoney += sourceMoney.valueInCurrency(currency: Currency.init(rawValue: i)!)
            strTargetMoney += "\r\n"
        }
        
        
        labelResult.text = strTargetMoney
        
    }
}

