//
//  ViewController.swift
//  Week_03_CollatzConjecture
//
//  Created by leejaesung on 2017. 5. 24..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 콜라츠 추측
    // 임의의 양의 정수 N에 대하여
    // 1. 짝수라면 2로 나누고, 홀수라면 3을 곱하고 1을 더한다.
    // 2. 1이 될 때까지 반복하고 반복한 횟수를 출력한다
    // 27149의 결과는?
    
    @IBOutlet weak var textfieldInputNumber: UITextField!
    @IBOutlet weak var labelPrintResult: UILabel!
    
    var arrayResult:[Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonConfirm(_ sender: UIButton) {
        if textfieldInputNumber.text?.isEmpty == true {
            showDialog(title: "경고", message: "숫자를 먼저 입력해주세요.")
            return
        }else if textfieldInputNumber.text == "1" {
            showDialog(title: "경고", message: "2 이상의 숫자를 입력해주세요.")
            return
        }else {
            labelPrintResult.text = String(calculate(ofNum: Int(textfieldInputNumber.text!)!))
        }
        
    }
    
    @IBAction func buttonFibonacci(_ sender: UIButton) {
        labelPrintResult.text = String(fibonacci(ofNum: Int(textfieldInputNumber.text!)!))
        
        print(arrayResult)
        
    }
    
    
    // MARK: 계산 로직
    func calculate(ofNum number:Int) -> Int {
        var vNum:Int = number
        var vTryNum:Int = 0
        
        while vNum != 1 {
            if vNum % 2 == 0 {
                vNum /= 2
            }else {
                vNum = vNum * 3 + 1
            }
            vTryNum += 1
        }
        print(vTryNum)
        
        return vTryNum
    }
    
    // MARK: 확인 버튼 있는 다이얼로그 띄우는 함수
    func showDialog(title: String, message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
        
    }
    
    
    // MARK: 피보나치 수열 연습
    func fibonacci(ofNum inputNumber:Int) -> Int {
        if inputNumber == 0 {
            return 0
        }else if inputNumber == 1{
            return 1
        }else {
            
            //F(n) = F(n-1) + F(n-2)
            
            return fibonacci(ofNum: inputNumber - 1) + fibonacci(ofNum: inputNumber - 2)
        }
    }

}

