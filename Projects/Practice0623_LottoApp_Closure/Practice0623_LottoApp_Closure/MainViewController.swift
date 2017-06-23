//
//  ViewController.swift
//  Practice0623_LottoApp_Closure
//
//  Created by leejaesung on 2017. 6. 23..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    /*
     #클로져, #closure, #UIAlertController, #UIAlertAction
     
     6개 랜덤의 로또 번호를 뽑아서 큰 순서대로 정렬시키고, 값을 저장해 히스토리를 보여주는 앱.
     클로져를 활용한 랜덤 번호 Sorted 기능을 활용하고, Custom UIAlert를 만들기 위해 Closure를 활용하였습니다.
 */

    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ********** START **********
    
    // MARK: START 버튼 액션 정의.
    @IBAction func buttonStartAction(_ sender: UIButton) {
        let vRandomNumber = pickRandomLottoNumber()
        
        guard var realLottoHistory = UserDefaults.standard.array(forKey: "LottoHistory") as? [[Int]] else {
            
            labelResult.text = ""
            for i in vRandomNumber {
                if labelResult.text == "" {
                    labelResult.text = String(i)
                }else {
                    labelResult.text = "\(labelResult.text!), \(String(i))"
                }
            }
            
            UserDefaults.standard.set([vRandomNumber], forKey: "LottoHistory")
            
            return
        }
        
        realLottoHistory.append(vRandomNumber)
        UserDefaults.standard.set(realLottoHistory, forKey: "LottoHistory")
        
        labelResult.text = ""
        for i in vRandomNumber {
            if labelResult.text == "" {
                labelResult.text = String(i)
            }else {
                labelResult.text = "\(labelResult.text!), \(String(i))"
            }
        }
    }

    @IBAction func buttonHistoryAction(_ sender: UIButton) {
        // "MoveHistoryView" segue를 통해 다음 뷰로 이동.
    }
    
    // UserDefaults가 비어 있을 경우, Segue 불가.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "MoveHistoryView" {
            guard (UserDefaults.standard.array(forKey: "LottoHistory") as? [[Int]]) != nil else {
                alertCustomOf(pTitle: "알림", pMsg: "히스토리가 없습니다.")
                return false
            }
        }
        
        return true
    }
    
    // MARK: Reset 버튼 액션 정의
    @IBAction func buttonResetAction(_ sender: UIButton) {
        
        alertCustomOf(pTitle: "알림", pMsg: "데이터를 초기화 하시겠습니까?") { (sender) in
            UserDefaults.standard.removeObject(forKey: "LottoHistory")
            
            self.labelResult.text = ""
            self.alertCustomOf(pTitle: "알림", pMsg: "데이터가 초기화 되었습니다.")
        }
        
    }
    
    // MARK: ********** Custom Function **********
    
    // MARK: 6개의 랜덤 로또 번호를 뽑고, 큰 순서대로 Sorted 시키는 함수
    func pickRandomLottoNumber() -> [Int] {
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            numberSet.insert(Int(arc4random_uniform(UInt32(45)))+1)
        }
        
        let resultArray = numberSet.sorted(by: {(num1:Int, num2:Int) -> Bool in
            return num1 < num2
        })
        
        return resultArray
    }
    
    // MARK: 확인 버튼만 있는 커스텀 Alert
    func alertCustomOf(pTitle:String, pMsg:String) {
        let alert:UIAlertController = UIAlertController(title: pTitle, message: pMsg, preferredStyle: .alert)
        let okAction:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: 클로져를 사용한 커스텀 Alert
    func alertCustomOf(pTitle:String, pMsg:String, pHandler:((_ sender: UIAlertAction) -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: pTitle, message: pMsg, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: pHandler)
        let cancelAction: UIAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true) { 
            print("present success!")
        }
    }
    
}

