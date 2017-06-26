//
//  ViewController.swift
//  Practice0626_Closure
//
//  Created by leejaesung on 2017. 6. 26..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let changeStr = {(input: Int) -> String in return String(input)}
        print(changeStr(5))
        
        // MARK: ***** Int형 배열 받아서 String형 배열 구하기 *****
        let changeArray = {(input: [Int]) -> [String] in
            var result:[String] = []

            for i in input {
                result.append(String(i))
            }
            
            return result
        }
        
        print(changeArray([5, 4, 3]))
        
        
        // MARK: ***** 짝수 배열 구하기 *****
        let printEvenNumber = {(input: [Int]) -> [Int] in
            var result:[Int] = []

            for i in input {
                if i % 2 == 0 {
                    result.append(i)
                }
            }
            
            return result
        }
        
        print(printEvenNumber([2, 4, 5, 7, 1]))
        
        
        // MARK: ***** map *****
        let arrayA = [2, 3, 12, 4, 6, 2, 3, 6, 7]
        let strArrayA = arrayA.map { (input) -> String in return String(input) }
        print(strArrayA)
        
        
        // MARK: ***** filter *****
        let oddNumberArrayA = arrayA.filter { (number) -> Bool in
            return number % 2 != 0
        }
        print(oddNumberArrayA)
        
        
        // MARK: ***** 구구단 구하기 *****
        // 구구단 구하는 클로저: (Int) -> [Int]
        let multiplication = { (input: Int) -> [Int] in
            var result:[Int] = []
            for i in 1...9 {
                result.append(input * i)
            }
            return result
        }
        print(multiplication(5))
        
        
        // MARK: ***** 팩토리얼 구하기 *****
        let factorial = { (input: Int) -> Int in
            var result:Int = 0
            let arrayInput = 1...input
            result = arrayInput.reduce(1, { (num1, num2) -> Int in
                num1 * num2
            })
            
            return result
        }
        print(factorial(5))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

