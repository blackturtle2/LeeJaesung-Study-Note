//
//  ViewController.swift
//  Calculation
//
//  Created by leejaesung on 2017. 5. 10..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class CaculationViewController: UIViewController {

    /*
     주제: iOS 스쿨 일주일차, 계산기 만들기 프로젝트.
     숫자를 누르고, 연산 버튼을 누른 후, 다시 숫자를 누르고, = 버튼을 눌러 결과를 확인하는 단순한 계산기 프로젝트.
     스토리보드를 이용해 UI를 그리고, IBAction, IBOutlet 등으로 소스와 연결하여 function화 시켜 작동을 확인하는 것에 목적이 있습니다.
     소수점과 퍼센트(%) 등 몇가지 기능을 제외하고는 정상 작동되는 프로젝트입니다.
     */
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var displayOperationLabel: UILabel!
    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    var tempOperation:String = ""
    var displayNumber:String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: ********** JS fuction START **********
    
    @IBAction func buttonInfoAction(_ sender:UIButton) {
        // Info 버튼의 액션을 정의합니다. 추후에 이 프로젝트의 설명을 Alert로 표시할 예정입니다.
        print("Success")
    }
    
    
    // MARK: C 버튼 액션 정의.
    @IBAction func clickButtonClear(_ sender: UIButton) {
        print("C 버튼이 클릭되었습니다.")
        
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"
        
        self.displayLabel.text = displayNumber
    }
    
    // MARK: 기능 버튼 액션 정의
    @IBAction func clickButtonPlusMinus(_ sender: UIButton) {
        print("+/- 버튼이 클릭되었습니다.")
        
        displayNumber = String(Int(displayNumber)! * -1)
        self.displayLabel.text = displayNumber
        
        addFirstNumOrSecondNum(number: displayNumber)
    }
    
    @IBAction func clickButtonPercent(_ sender: UIButton) {
        print("% 버튼이 클릭되었습니다.")
        
        tempOperation = "%"
        displayNumber = "0"
        displayOperationLabel.text = tempOperation
    }
    
    @IBAction func clickButtonDivide(_ sender: UIButton) {
        print("/ 버튼이 클릭되었습니다.")
        
        tempOperation = "÷"
        displayNumber = "0"
        displayOperationLabel.text = tempOperation
    }
    
    @IBAction func clickButtonTime(_ sender: UIButton) {
        print("x 버튼이 클릭되었습니다.")
        
        tempOperation = "×"
        displayNumber = "0"
        displayOperationLabel.text = tempOperation
    }
    
    @IBAction func clickButtonMinus(_ sender: UIButton) {
        print("- 버튼이 클릭되었습니다.")
        
        tempOperation = "−"
        displayNumber = "0"
        displayOperationLabel.text = tempOperation
    }
    
    @IBAction func clickButtonPlus(_ sender: UIButton) {
        // 참고: 강사님의 명명법: touchUpInsidePlusBtn
        print("+ 버튼이 클릭되었습니다.")
        
        tempOperation = "+"
        displayNumber = "0"
        displayOperationLabel.text = tempOperation
    }
    
    @IBAction func clickButtonEqual(_ sender: UIButton) {
        print("= 버튼이 클릭되었습니다.")
        var resultValue:Int = 0
        
        switch tempOperation {
        case "+":
            resultValue = plus(num1: tempFirstNum, num2: tempSecondNum)
        case "−":
            resultValue = tempFirstNum - tempSecondNum
        case "×":
            resultValue = tempFirstNum * tempSecondNum
        case "÷":
            resultValue = tempFirstNum / tempSecondNum
        case "%":
            resultValue = tempFirstNum / tempSecondNum * 100
        default:
            resultValue = 0
        }
        displayLabel.text = "\(resultValue)"
        
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"
        displayOperationLabel.text = tempOperation
    }
    
    @IBAction func clickButtonPoint(_ sender: UIButton) {
        print(". 버튼이 클릭되었습니다.")
    }
    
    // MARK: 디스플레이에 "0"이 맨 앞자리에 있는지 판단해서 displayNumber에 숫자를 저장하는 함수
    func addDisplayNumber(num:String) {
        switch displayNumber {
        case "0":
            displayNumber = num
        default:
            displayNumber += num
        }
    }
    
    // MARK: 첫번째 숫자인지, 두번째 숫자(연산 버튼을 누른 다음 누르는 숫자)인지 판단해서 각각에 저장하는 함수
    func addFirstNumOrSecondNum(number num:String) {
        
        if tempOperation.isEmpty {
            // 첫번째 숫자
            tempFirstNum = Int(displayNumber)!
            
            //"!"는 이 변수가 절대 nil이 될 수 없어! 라는 의미입니다. 개발자의 보증수표랄까..
            //displayLabel.text는 절대 nil이 될 수 없고, String 값이 Int가 될 때도 String에 문자만 있을리 없어라고 이야기하는 의미입니다.
        }else{
            // 두번째 숫자
            tempSecondNum = Int(displayNumber)!
        }
    }
    
    // MARK: 숫자 버튼들 액션 정의
    @IBAction func numberButtonTouched(_ sender: UIButton) {
        print("\(sender.currentTitle!)) 번 버튼이 클릭되었습니다.")
        
        addDisplayNumber(num: (sender.titleLabel?.text)!)
        //addDisplayNumber(num: sender.currentTitle!)
        
        addFirstNumOrSecondNum(number: displayNumber)
        
        self.displayLabel.text = displayNumber
    }
    
    
    // MARK: 더하기 함수
    func plus(num1:Int, num2:Int) -> Int {
        print("두 수의 합은 \(num1 + num2)입니다.")
        
        return num1 + num2
    }
    
}
