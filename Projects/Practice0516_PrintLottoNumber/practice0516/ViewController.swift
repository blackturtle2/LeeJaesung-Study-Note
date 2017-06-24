//
//  ViewController.swift
//  practice0516
//
//  Created by leejaesung on 2017. 5. 16..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(findLotto())
        print(makeDivisor(number: 10))
        print(isPrimeNumberOf(number: 100))
        
        var dic:Dictionary<String, Int> = [ "A" : 1, "B" : 2, "C" : 3 ]
        
        print("\(dic["A"]!)")
        
        var testDic:[String:Int] = [:]
        testDic = ["Lee" : 95, "Kim" : 80, "Park" : 75]
        
        print(testDic["LEE"]!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 로또 번호 뽑기 프로토타입 ( max 45, 숫자 6개 뽑기 )
    func findLottoProtoType() -> [Int] {
        var lottoNumbers:[Int] = []
        
        for _ in 1...6{
            let randomNum:UInt32 = arc4random_uniform(45)
            lottoNumbers.append(Int(randomNum))
        }
        
        return lottoNumbers
    }
    
    // MARK: 로또 번호 뽑기 (중복 제거)
    func findLotto() -> [Int] {
        var lottoNumbers:[Int] = []
        
        while lottoNumbers.count < 6 {
            let randomNum:UInt32 = arc4random_uniform(45)
            
            if randomNum != 0 && !lottoNumbers.contains(Int(randomNum)) { // 로또 번호에 0이 들어가면 안된다.
                lottoNumbers.append(Int(randomNum))
            }
        }
        
        return lottoNumbers
    }
    
    // MARK: 약수 구하기
    func makeDivisor(number num:Int) -> [Int] {
        var result:[Int] = []
        
        for i in 1...num {
            if num % i == 0 {
                result.append(i)
            }
        }
        
        return result
    }
    
    // MARK: 소수 판별기
    func isPrimeNumberOf(number num:Int) -> Bool {
        var result:Bool = false

        if makeDivisor(number: num).count <= 2 {
            result = true
        }
        
        return result
    }
}
