//
//  ViewController.swift
//  Practice0614_enum
//
//  Created by leejaesung on 2017. 6. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

enum Tool {
    case number(Int)
    indirect case add(Tool, Tool)
    indirect case minus(Tool, Tool)
    indirect case multi(Tool, Tool)
}

// (1+2)*3


class ViewController: UIViewController {
    
    var jsToolBox:JsToolBox = JsToolBox()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vNumberTwo = Tool.number(2)
        let vNumberThree = Tool.number(3)
        let vNumberFour = Tool.number(4)
        
        let value:Tool = Tool.add(Tool.minus(vNumberTwo, vNumberFour), vNumberThree)
        
        print(evaluate(input: value)) // print "1"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func evaluate(input:Tool) -> Int {
        switch input {
        case let .number(value):
            return value
        case let .add(left, right):
            return evaluate(input: left) + evaluate(input: right)
        case let .minus(left, right):
            return evaluate(input: left) - evaluate(input: right)
        case let .multi(left, right):
            return evaluate(input: left) * evaluate(input: right)
        
        }
    }
    
    @IBAction func buttonOkayAction(_ sender:UIButton) {
        jsToolBox.showAlert(type: .loginSuccess, sender: self)
    }
    
}

