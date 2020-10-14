//
//  ViewController.swift
//  Practice0612_Sum(n)_Print(middleChar)
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldIntPutNumber: UITextField!
    @IBOutlet weak var labelFirstResult: UILabel!
    @IBOutlet weak var textFiedlInPutString: UITextField!
    @IBOutlet weak var labelSecondResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonFirstFunction(_ sender: UIButton) {
        
        if (textFieldIntPutNumber.text?.isEmpty)! {
            showAlert(vTitle: "Warning", vMessage: "숫자를 먼저 입력해주세요.")
            return
        }
        
        labelFirstResult.text = "Result: \(String(sum(number: Int(textFieldIntPutNumber.text!)!)))"
        
    }

    
    @IBAction func buttonSecondFunction(_ sender: UIButton) {
        
        if (textFiedlInPutString.text?.isEmpty)! {
            showAlert(vTitle: "Warning", vMessage: "텍스트를 먼저 입력해주세요.")
            return
        }
        
        labelSecondResult.text = "Result: \(printMiddleChar(input: textFiedlInPutString.text!))"
    }
    
    
    /// 1~N 까지의 합 구하기
    // 반복문 사용 or 공식 사용(n*(n+1)/2). or 재귀 사용.
    func sum(number n:Int) -> Int {
        var result:Int = 0
        
        if n <= 0 {
            return 0
        }else {
            result = sum(number: n-1) + n
        }
        
        return result
    }
    
    /// 가운데 문자 출력하기
    // ex) apple --> "P" / iPad --> "Pa"
    func printMiddleChar(input s:String) -> String {
        var result:String = "error-"
        var myArray:[Character] = []
        
        for c in s.characters {
            myArray.append(c)
        }
        
        let arrayCount:Int = myArray.count/2
        
        if (myArray.count % 2) == 0 {
            result = "\(myArray[arrayCount-1])\(myArray[arrayCount])"
        }else {
            result = "\(myArray[arrayCount])"
        }
        
        return result
    }
    
    // Alert 만들기
    func showAlert(vTitle: String, vMessage: String) {
        let alert:UIAlertController = UIAlertController(title: vTitle, message: vMessage, preferredStyle: .alert)
        let okButton:UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}



