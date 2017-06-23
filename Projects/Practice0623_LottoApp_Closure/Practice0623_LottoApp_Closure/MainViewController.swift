//
//  ViewController.swift
//  Practice0623_LottoApp_Closure
//
//  Created by leejaesung on 2017. 6. 23..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.pickRandomLottoNumber())
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert:UIAlertController = UIAlertController(title: "알림", message: nil, preferredStyle: .alert )
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(sender: UIAlertAction) in print("push ok")})
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: {print("present")})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ********** START **********
    
    @IBAction func buttonStartAction(_ sender: UIButton) {

    }

    @IBAction func buttonHistoryAction(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonResetAction(_ sender: UIButton) {
        
    }
    
    // MARK: ********** Custom Function **********
    
    func pickRandomLottoNumber() -> [Int] {
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            numberSet.insert(Int(arc4random_uniform(UInt32(45)))+1)
        }
        
        let resultArray = numberSet.sorted(by: {(num1:Int, num2:Int) -> Bool in
            return num1 < num2
        })

//        let arrayTest = [234, 123, 345, 456, 567, 678]
//        
//        let arrayNewTest = arrayTest.sorted { (a:Int, b:Int) -> Bool in
//            return a > b
//        }
        
        return resultArray
//        return arrayNewTest
    }
    
}

