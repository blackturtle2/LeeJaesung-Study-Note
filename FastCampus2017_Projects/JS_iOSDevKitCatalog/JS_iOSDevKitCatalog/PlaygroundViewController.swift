//
//  PlaygroundViewController.swift
//  JS_iOSDevKitCatalog
//
//  Created by leejaesung on 2017. 6. 24..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class PlaygroundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 함수의 문법 복습 예제
        var numA:Int = 10
        
        func addTwoNum(firstNumb num1:Int, secondNumb num2:Int) -> Int{
            return num1 + num2
        }
        var result1:Int = addTwoNum(firstNumb: 1, secondNumb: 2) // = 3
        
        func square(of number:Int) -> Int{
            return number * number
        }
        var result2:Int = square(of: 5) // = 25
        
        print("")
        
        // 짝수를 구하는 함수
        func isEven(number num:Int) -> Bool {
            if num % 2 == 0{
                
            }
            return true
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
