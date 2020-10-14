//
//  SecondViewController.swift
//  DainingPractice
//
//  Created by 김태형 on 2017. 6. 15..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cellCount:Double?
    var userNameArray2:Array<String>?
    var arrayMoney:[Int]?
    var money:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(doubleArray(n:5))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userNameArray2?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell:CustomViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! CustomViewCell
        myCell.userNameLabel.text = userNameArray2?[indexPath.row]
        myCell.moneyLabel.text = String(money! * doubleArray(n: (userNameArray2?.count)!)[indexPath.row])
        
//        Int(arc4random())
        
        return myCell
    }
    
    
    func doubleArray(n: Int) -> Array<Double>
    {
        var a = n
        let b = n
        var c:Double = 1
        var d:Array<Double> = [0]
        
        if a == 2
        {
            return [0, 1]
        }else
        {
            while a >= 3
            {
                c *= 0.5
                d.append(c)
                a -= 1
                
            }
            d.append(d[b-2])
        }
        return d
    }
    
//    func randomArray(n: Array<Double>) -> Array<Double>
//    {
//        
//    }
}
