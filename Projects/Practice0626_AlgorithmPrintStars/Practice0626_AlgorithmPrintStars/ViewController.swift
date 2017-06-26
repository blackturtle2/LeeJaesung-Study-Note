//
//  ViewController.swift
//  Practice0626_AlgorithmPrintStars
//
//  Created by leejaesung on 2017. 6. 26..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     Let starPrint: (Int) -> Void
     
     문제 1.
     *
     **
     ***
     ****
     *****
     
     문제 2.
       *
      ***
     *****
     
     문제 3.
       *
      ***
     *****
      ***
       *
     
     프린트 찍기.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let starPrint1: (Int) -> Void = { (lineNumb: Int) in
            for i in 1...lineNumb {
                var str: String = ""
                for _ in 1...i {
                    str += "*"
                }
                print(str)
            }
        }
        
        starPrint1(5)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

