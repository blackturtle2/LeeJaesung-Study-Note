//
//  ViewController.swift
//  Practice0714_GCD
//
//  Created by leejaesung on 2017. 7. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let q1 = DispatchQueue(label: "com.blackturtle2.q1", qos: .unspecified)
        let q2 = DispatchQueue(label: "com.blackturtle2.q2", qos: .background)
        let q3 = DispatchQueue(label: "com.blackturtle2.q3", qos: .userInitiated)
        q1.async {
            print("hi q1")
            for n in 100..<200 {
                print(n)
            }
        }
        
        q2.async {
            print("hi q2")
            for n in 200..<300 {
                print(n)
            }
        }
        
        q3.async {
            print("hi q3")
            for n in 300..<400 {
                print(n)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

