//
//  ViewController.swift
//  Practice0517
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s1:Student = Student(name: "Lee")
        s1.add(subjectName: "수학", score: 95)
        s1.add(subjectName: "물리", score: 80)
        s1.add(subjectName: "영어", score: 85)
        s1.add(subjectName: "화학", score: 80)
        s1.add(subjectName: "생물", score: 85)
        
        let s2:Student = Student(name: "Kim")
        s2.add(subjectName: "수학", score: 75)
        s2.add(subjectName: "물리", score: 85)
        s2.add(subjectName: "영어", score: 82)
        s2.add(subjectName: "화학", score: 96)
        s2.add(subjectName: "생물", score: 95)
        
        let manager:ScoreManager = ScoreManager()
        let s1_Average = manager.average(forStudent: s1)
        let s2_Average = manager.average(forStudent: s2)
        let s1_Total = manager.makeTotal(forstudent: s1)
        let s2_Total = manager.makeTotal(forstudent: s2)
        
        print("합계 계산")
        print(s1_Total)
        print(s2_Total)
        
        print("평균 계산")
        print(s1_Average)
        print(s2_Average)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func runButtonTouched(_ sender: UIButton) {
        let numb: Int = Int(self.inputTextField.text!)!
        //self.isEven(number: numb)
        self.makeDivisor(number: numb)
    }
    
    func makeDivisor(number num:Int) {
        var result: Int = 0
        
        if num <= 2 {
            self.resultLabel.text = "잘못 입력했엉!"
        } else {
            for i in 2..<num {
                if num % i == 0 {
                    result += i
                }
            }
        }
        
        self.resultLabel.text = "결과는 \(String(result)) 입니다."
    }
    

    //var friendList:Array<Dictionary<String,String>>? //아래 선언과 같은 뜻의 표현.
    //var friendList:Array<[String:String]>? //아래 선언과 같은 뜻의 표현.
    var friendList:[[String:String]]?
    
    func addFriend(name: String, gender:String) {
        var friend:[String:String] = [String:String]()
        
        friend.updateValue(name, forKey: "name")
        friend.updateValue(gender, forKey: "gender")
        
        addFriend(friendData: friend)
    }
    
    func addFriend(friendData:[String:String]) {
        if friendList == nil {
            friendList = []
        }
        
        friendList!.append(friendData)
    }
    
    func friendNames() -> [String] {
        
        guard let friends = friendList else{
            return []
        }
        
        var returnList:[String] = []
        
        for friend:[String:String] in friends {
            let name:String = friend["name"]!
            returnList.append(name)
        }
        
        return returnList
        
    }
    
    func printFriendName() {
        if let friends = friendList { // 옵셔널 바인딩
            
            for friend in friends {
                
                for (key,value) in friend {
                    if key == "Kim" {
                        print(value)
                    }
                }
                
                // let name = friend["name"]
                // print(name)
                
            }
        }
        
    }
    
}

