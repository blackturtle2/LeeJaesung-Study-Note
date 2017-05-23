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
    // @IBOutlet weak var labelInsertNumber: UILabel! // 3개의 레이블을 묶고는 태그로 분류해서 사용하려고 했으나.. 실패하고, 각각 분리.
    @IBOutlet weak var labelInsertNumber1: UILabel!
    @IBOutlet weak var labelInsertNumber2: UILabel!
    @IBOutlet weak var labelInsertNumber3: UILabel!
    
    @IBOutlet weak var buttonGameRestart: UIButton!
    
    
    var correctAnswer:[Int] = [] // 정답 배열 변수
    var userCurrentAnswer:[Int] = [] // 사용자 입력 배열 변수
    
    var trynumber:Int = 1 // 사용자 시도 횟수
    var currentStatus:Status = Status() // 현재 상황
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 랜덤으로 구성된 3개의 엘리먼트를 가진 정답, correctAnswer 초기화
        correctAnswer = makeCorrectAnswer()
        print(correctAnswer)
        
        /* 스토리보드에서 추가한 버튼과 유사하게 만들려다가 패스.
        let btnNumber:UIButton = UIButton(frame: CGRect(x: 50, y: 150, width: 200, height: 50))
        btnNumber.setTitle("button", for: .normal )
        btnNumber.backgroundColor = UIColor.black
        btnNumber.tintColor = UIColor.red
        btnNumber.showsTouchWhenHighlighted = true
        btnNumber.tag = 1
        
        self.view.addSubview(btnNumber)
        */
        
        /* 버튼 만들다가 포기... addTarget을 알 수가 없다.
        let button = UIButton();
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.frame = CGRect(x: 25, y: 25, width: 35, height: 30)

        button.addTarget(self, action: Selector("buttonPressed:"), for: .touchUpInside)
        button.backgroundColor = UIColor(red: (31/255.0), green: (146/255.0), blue: (160/255.0), alpha: 1.0)
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        self.view.addSubview(button)
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: 숫자 버튼 액션 정의 함수
    @IBAction func buttonInsertNumber(_ sender: UIButton) {
        let vTag:Int = sender.tag
        let strTag:String = String(vTag)
        
        if userCurrentAnswer.contains(vTag) {
            showDialog(title: "경고", message: "이미 입력한 숫자입니다.\r다른 숫자를 눌러주세요.")
            return
        }
        
        userCurrentAnswer.append(vTag)

        switch userCurrentAnswer.count {
        case 1:
            labelInsertNumber1.text = strTag
        case 2:
            labelInsertNumber2.text = strTag
        case 3:
            labelInsertNumber3.text = strTag
        default:
            showDialog(title: "알림", message: "모두 입력했습니다.\r정답을 확인해보세요-!")
            userCurrentAnswer.removeLast()
            return
        }
        
        
        // 질문1. 라벨 3개를 아울렛 하나로 묶고, 태그로 분리가 가능한지.
        // 질문2. Switch-case에서 클래스 타입의 배열에 넣고, 버튼 누를 때마다 체크하는 것 다시 한번..
        
        
        //        Q&A 특정 태그에 해당하는 레이블에 텍스트를 넣는 것은 불가능할까..
        //        내일 여쭤보는 걸로...............
        //        let vLabel = labelInsertNumber.viewWithTag(0)
        //        vLabel!.text = "hi"
    }
    
    
    // MARK: 확인 버튼 액션 정의 함수
    @IBAction func buttonConfirm(_ sender: UIButton) {
        if userCurrentAnswer.count < 3 {
            showDialog(title: "경고", message: "숫자 버튼을 먼저 눌러주세요.")
            trynumber -= 1
            return
        }
        
        trynumber += 1 // 시도 횟수 +1
        currentStatus.setFree() // 상태 초기화
        
        // 상태 체크 로직 시작
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
        // 상태 체크 로직 끝
        
        if currentStatus.strike == 3 {
            showDialog(title: "알림", message: "정답입니다-!")
            labelStatus.text = "3 STRIKE - !"
            
            buttonGameRestart.isHidden = false
            
        }else {
            showDialog(title: "알림", message: "실패입니다-!\r\r공격 넘버: \(userCurrentAnswer[0]) , \(userCurrentAnswer[1]) , \(userCurrentAnswer[2])")
            
            labelTryNumber.text = "\(String(trynumber)) 번째 공격" // 시도 횟수 출력
            labelStatus.text = "\(currentStatus.out) OUT , \(currentStatus.ball) BALL , \(currentStatus.strike) STRIKE - !"
            
            userCurrentAnswer.removeAll()
            labelInsertNumber1.text = "_"
            labelInsertNumber2.text = "_"
            labelInsertNumber3.text = "_"
            
        }
    }
    
    
    // MARK: 폭탄 이모티콘의 초기화 버튼 함수
    @IBAction func buttonInitGame(_ sender: UIButton) {
        
        initGame()
        
    }
    
    // 초기화 함수
    func initGame() {
        
        correctAnswer = makeCorrectAnswer()
        print(correctAnswer)
        showDialog(title: "알림", message: "게임이 초기화되었습니다.")
        
        userCurrentAnswer.removeAll()
        labelInsertNumber1.text = "_"
        labelInsertNumber2.text = "_"
        labelInsertNumber3.text = "_"
        
        labelTryNumber.text = "1 번째 공격"
        labelStatus.text = ""
    }
    
    
    // MARK: 정답을 랜덤으로 만드는(초기화) 함수
    func makeCorrectAnswer() -> [Int] {
        var result:[Int] = []
        
        for _ in 1...3 {
            var randomNum = Int(arc4random_uniform(9)+1) //arc4random_uniform(범위)+시작점
            
            while result.contains(randomNum) {
                randomNum = Int(arc4random_uniform(9)+1)
            }
            result.append(randomNum)
        }
        
        return result
    }
    
    // MARK: 게임 재시작 버튼 액션 함수
    @IBAction func buttonGameRestartAction(_ sender: UIButton) {
        initGame()
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

