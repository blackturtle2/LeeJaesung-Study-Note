//
//  ViewController.swift
//  TowerOfHanoi
//
//  Created by leejaesung on 2017. 5. 24..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textViewOfResult: UITextView!
    var tryNum:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let n:Int = 5
        moveNum(number: n, from: "A", pass:"B", to: "C")
        
        print("\r = Try Number Result: \(tryNum)")
        textViewOfResult.insertText("\r = Try Number Result: \(tryNum)\r")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func moveNum(number n:Int, from vFrom:String, pass vPass:String, to vTo:String) {
        if n == 1 {
            textViewOfResult.insertText("\(n)번 원판을 `\(vFrom)`에서 `\(vTo)`로 이동\r")
        }else {
            
            moveNum(number: n-1, from: vFrom, pass: vTo, to: vPass)
            
            textViewOfResult.insertText("\(n)번 원판을 `\(vFrom)`에서 `\(vTo)`로 이동\r")
            
            moveNum(number: n-1, from: vPass, pass: vFrom, to: vTo)
        }
        
        tryNum += 1
        
        /* 로직 이해하기
         [1:n-1] A --> B
            [1:n-2] A --> C
            [n-2]   A --> B
            [1:n-2] C --> B
         [n]     A --> C
         [1:n-1] A --> C
         */
    }
}
