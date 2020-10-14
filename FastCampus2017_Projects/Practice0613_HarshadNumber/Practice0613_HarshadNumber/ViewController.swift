//
//  ViewController.swift
//  Practice0613_HarshadNumber
//
//  Created by leejaesung on 2017. 6. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number:Int = 12345
        var vArray:[Int] = [] // vArray는 무조건 초기화해야 append 할 수 있습니다.
        
        while number % 10 > 0 {
//            vArray.append(number % 10)
            vArray.insert(number % 10, at: 0)
            number = number / 10
        }
        
        print(vArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

