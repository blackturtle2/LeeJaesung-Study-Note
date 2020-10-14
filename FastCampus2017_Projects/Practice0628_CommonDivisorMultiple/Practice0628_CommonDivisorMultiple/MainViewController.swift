//
//  ViewController.swift
//  Practice0628_CommonDivisorMultiple
//
//  Created by leejaesung on 2017. 6. 28..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var textFieldNum1: UITextField!
    @IBOutlet weak var textFieldNum2: UITextField!
    @IBOutlet weak var segmentedControlSetting: UISegmentedControl!
    @IBOutlet weak var labelResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedControlSettingAction(_ sender: UISegmentedControl) {
        
        
    }

    @IBAction func buttonComputeAction(_ sender: UIButton) {
        guard let strNum1 = textFieldNum1.text else { return }
        guard let strNum2 = textFieldNum2.text else { return }
        
        if strNum1.isEmpty { labelResult.text = "[숫자 1]을 입력해주세요."; return }
        if strNum2.isEmpty { labelResult.text = "[숫자 2]를 입력해주세요."; return }
        
        let vNum1:Int = Int(strNum1)!
        let vNum2:Int = Int(strNum2)!
        
        
        // ***** 로직 시작 ***** //
        var arrayDivisor1:[Int] = []
        var arrayDivisor2:[Int] = []
        
//        for i in 1...vNum1 {
//            if vNum1 % i == 0 {
//                arrayDivisor1.append(i)
//            }
//        }
//        
//        for i in 1...vNum2 {
//            if vNum2 % i == 0 {
//                arrayDivisor2.append(i)
//            }
//        }
        
        for i in 1...vNum1 {
            <#code#>
        }
        
        
        // 15, 10
        
        
        // ***** 로직 끝 ***** //
        
        labelResult.text = String(vNum1 + vNum2)
    }
}

