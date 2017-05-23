//
//  ViewController.swift
//  BaseballProject
//
//  Created by leejaesung on 2017. 5. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 시스템이 임의의 숫자 3개를 답으로 저장한다.
    // 사용자가 버튼으로 숫자 3개를 선택한다.
    // 확인하기 버튼을 누르면,"0번째 시도 - 0 OUT, 0 BALL, 0 STRIKE"라고 메시지가 뜬다.
    // Out = 값과 위치 모두 틀릴 때.
    // Ball = 값은 일치하지만 위치는 틀릴 때.
    // Strike = 3개 모두 정답일 때.
    
    
    // 시도 횟수 표시하는 레이블
    @IBOutlet weak var labelTryNumber: UILabel!
    
    // out, ball, strike 표시하는 레이블
    @IBOutlet weak var labelStatus: UILabel!
    
    // 사용자가 입력한 숫자 표시하는 레이블 3개 묶음 - 태그에 0, 1, 2 넣음.
    @IBOutlet weak var labelInsertNumber1: UILabel!
    @IBOutlet weak var labelInsertNumber2: UILabel!
    @IBOutlet weak var labelInsertNumber3: UILabel!
    
    @IBOutlet weak var buttonGameRestart: UIButton!
    
    
    var correctAnswer:[Int] = [] // 정답 배열 변수
    var userCurrentAnswer:[Int] = [] // 사용자 입력 배열 변수
    
    var tryNumber:Int = 1 // 사용자 시도 횟수
    var currentStatus:Status = Status() // 현재 상황
    
    var vLabelInsertNumber:[UILabel] = []
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGame()
        
        vLabelInsertNumber.append(labelInsertNumber1)
        vLabelInsertNumber.append(labelInsertNumber2)
        vLabelInsertNumber.append(labelInsertNumber3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: 숫자 버튼 액션 정의 함수
    @IBAction func buttonInsertNumber(_ sender: UIButton) {
        let strTag:String = String(sender.tag)
        
        guard !userCurrentAnswer.contains(sender.tag) else {
            showDialog(title: "경고", message: "이미 입력한 숫자입니다.\r다른 숫자를 눌러주세요.")
            return
        }
        
        userCurrentAnswer.append(sender.tag)

        // 사용자 입력 레이블에 입력 값을 넣는 로직
        // 아래 주석 처리한 로직을 아래와 같이 UILabel의 엘리먼트로 갖는 배열 변수를 만들어 로직 재구성.
        let i = userCurrentAnswer.count
        
        switch i {
        case 1...i:
            vLabelInsertNumber[i-1].text = strTag
        default:
            showDialog(title: "알림", message: "모두 입력했습니다.\r정답을 확인해보세요-!")
            userCurrentAnswer.removeLast()
            return
        }
        
        //        switch userCurrentAnswer.count {
        //        case 1:
        //            labelInsertNumber1.text = strTag
        //        case 2:
        //            labelInsertNumber2.text = strTag
        //        case 3:
        //            labelInsertNumber3.text = strTag
        //        default:
        //            showDialog(title: "알림", message: "모두 입력했습니다.\r정답을 확인해보세요-!")
        //            userCurrentAnswer.removeLast()
        //            return
        //        }

    }
    
    
    // MARK: 확인 버튼 액션 정의 함수
    @IBAction func buttonConfirm(_ sender: UIButton) {
        
        // 숫자 3개를 누르지 않고, 확인 버튼을 눌렀을 때의 예외 처리
        if userCurrentAnswer.count < 3 {
            showDialog(title: "경고", message: "숫자 버튼을 먼저 눌러주세요.")
            tryNumber -= 1
            return
        }
        
        tryNumber += 1 // 시도 횟수 +1
        currentStatus.setFree() // 상태 초기화
        
        // 상태 체크 로직 - START
        for x in 0...2 {
            for y in 0...2 {
                if userCurrentAnswer[x] == correctAnswer[y] {
                    if x == y {
                        currentStatus.strike += 1
                    }else {
                        currentStatus.ball += 1
                    }
                }
            }
        }
        currentStatus.out = 3 - (currentStatus.strike + currentStatus.ball)
        // 상태 체크 로직 - END
        
        if currentStatus.strike == 3 {
            showDialog(title: "알림", message: "정답입니다-!")
            labelStatus.text = "3 STRIKE - !"
            
            buttonGameRestart.isHidden = false
            
        }else {
            showDialog(title: "알림", message: "실패입니다-!\r\r공격 넘버: \(userCurrentAnswer[0]) , \(userCurrentAnswer[1]) , \(userCurrentAnswer[2])")
            
            labelTryNumber.text = "\(String(tryNumber)) 번째 공격" // 시도 횟수 출력
            labelStatus.text = "\(currentStatus.out) OUT , \(currentStatus.ball) BALL , \(currentStatus.strike) STRIKE - !"
            
            userCurrentAnswer.removeAll()
            
            for i in 0...2 {
                vLabelInsertNumber[i].text = "_"
            }
        }
    }
    
    
    // MARK: 폭탄 이모티콘버튼 액션 함수
    @IBAction func buttonInitGame(_ sender: UIButton) {
        
        initGameAndShowDialog()
        
    }
    
    // MARK: 게임 초기화 함수
    func initGame() {
        correctAnswer = makeCorrectAnswer()
        print(correctAnswer)
        
        userCurrentAnswer.removeAll()
        
        if vLabelInsertNumber.count != 0 {
            for i in 0...2 {
                vLabelInsertNumber[i].text = "_"
            }
        }
        
        labelTryNumber.text = "1 번째 공격"
        labelStatus.text = "숫자를 눌러주세요."
    }
    
    
    // 게임 초기화 & 알림 출력 함수
    func initGameAndShowDialog() {
        
        initGame()
        showDialog(title: "알림", message: "게임이 초기화되었습니다.")
        
    }
    
    
    // MARK: 정답을 랜덤으로 만드는(초기화) 함수
    func makeCorrectAnswer() -> [Int] {
        var result:[Int] = []
        
        while result.count < 3 {
            let randomNum = Int(arc4random_uniform(9)+1) //arc4random_uniform(범위)+시작점
            
            if !result.contains(randomNum) {
                result.append(randomNum)
            }
        }
        
        return result
    }
    
    // MARK: 게임 재시작 버튼 액션 함수
    @IBAction func buttonGameRestartAction(_ sender: UIButton) {
        initGameAndShowDialog()
        buttonGameRestart.isHidden = true
    }
    
    
    // MARK: 확인 버튼 있는 다이얼로그 띄우는 함수
    func showDialog(title: String, message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
        
    }

}

