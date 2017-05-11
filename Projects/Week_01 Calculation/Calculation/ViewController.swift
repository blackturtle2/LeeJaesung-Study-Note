//
//  ViewController.swift
//  Calculation
//
//  Created by leejaesung on 2017. 5. 10..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        printf(name1: "leejaesungB")
//        add(num1: 128, num2: 256)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var firstNum:Int = 0
    var secondNum:Int = 0
    var totalNum:Int = 0
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func clickButtonClear(_ sender: UIButton) {
        print("C 버튼이 클릭되었습니다.")
        displayLabel.text = displayLabel.text! + String(sender.tag-1)
    }
    
    @IBAction func clickButtonPlusMinus(_ sender: UIButton) {
        print("+/- 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonPercent(_ sender: UIButton) {
        print("% 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonDivide(_ sender: UIButton) {
        print("/ 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonTime(_ sender: UIButton) {
        print("x 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonMinus(_ sender: UIButton) {
        print("- 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonPlus(_ sender: UIButton) {
        totalNum = firstNum + secondNum
        
        print(totalNum)
        print("+ 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonEqual(_ sender: UIButton) {
        print("= 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButtonPoint(_ sender: UIButton) {
        print(". 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton0(_ sender: UIButton) {
        print("0번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton1(_ sender: UIButton) {
        print("1번 버튼이 클릭되었습니다.")
        
        if firstNum == 0 {
            firstNum = 1
        }
        else{
            secondNum = 1
        }
    }
    
    @IBAction func clickButton2(_ sender: UIButton) {
        print("2번 버튼이 클릭되었습니다.")
        
        if firstNum == 0 {
            firstNum = 2
        }
        else{
            secondNum = 2
        }
        
    }
    
    @IBAction func clickButton3(_ sender: UIButton) {
        print("3번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton4(_ sender: UIButton) {
        print("4번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton5(_ sender: UIButton) {
        print("5번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton6(_ sender: UIButton) {
        print("6번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton7(_ sender: UIButton) {
        print("7번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton8(_ sender: UIButton) {
        print("8번 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickButton9(_ sender: UIButton) {
        print("9번 버튼이 클릭되었습니다.")
    }

//    func printf(name1 namestr:String){
//        print(namestr)
//    }
//    
//    func add(num1:Int, num2:Int){
//        print("두 수의 합은 \(num1 + num2)입니다.")
//    }

}
