//
//  ViewController.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelMyPocketmonStatus: UILabel!
    @IBOutlet weak var labelEnemyPocketmonStatus: UILabel!
    @IBOutlet weak var labelAttackStatus: UILabel!
    
    var selectedAttackNumber:Int?
    var selectedMyPocketmon:String?
    var selectedEnemyPocketmon:String?

    let pika:MonPikachu = MonPikachu()
    let rai:MonRaichu = MonRaichu()
    let pariry:MonPariry = MonPariry()
    
    let enemyPika:MonPikachu = MonPikachu()
    let enemyRai:MonRaichu = MonRaichu()
    let enemyPariry:MonPariry = MonPariry()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pariry.attack(toMonster: pika, skill: 1)
//        rai.attack(toMonster: pika, skill: 0)
//        rai.attack(toMonster: pika, skill: 3)
//        
//        let leejaesung:Trainer = Trainer(name: "leejaesung")
//        
//        print(leejaesung.isCatchMonsterOf(monster: pika))
        
    }
    
    // MARK: 내 포켓몬 선택 버튼 액션 정의
    @IBAction func buttonSelectedPocketmon(_ sender: UIButton) {
        
        guard let myPocketmon = sender.currentTitle else {
            return
        }
        //print("\(sender.currentTitle!) 버튼이 클릭되었습니다.")
        
        switch myPocketmon {
        case "피카츄":
            print("피카츄 선택!")
            selectedMyPocketmon = "pika"
            labelMyPocketmonStatus.text = "피카츄 [ HP: \(pika.hp) / TYPE: \(pika.type) ]"
        case "라이츄":
            print("라이츄 선택!")
            selectedMyPocketmon = "rai"
            labelMyPocketmonStatus.text = "라이츄 [ HP: \(rai.hp) / TYPE: \(rai.type) ]"
        case "파이리":
            print("파이리 선택!")
            selectedMyPocketmon = "pariry"
            labelMyPocketmonStatus.text = "파이리 [ HP: \(pariry.hp) / TYPE: \(pariry.type) ]"
        default:
            print("에러! - myPocketmon")
        }
        
    }
    
    // MARK: 적 포켓몬 선택 버튼 액션 정의
    @IBAction func buttonEnemyPocketmon(_ sender: UIButton) {
        
        guard let enemyPocketmon = sender.currentTitle else {
            print("ERROR-")
            return
        }
        //print("\(sender.currentTitle!) 버튼이 클릭되었습니다.")
        
        switch enemyPocketmon {
        case "피카츄":
            print("피카츄 선택!")
            selectedEnemyPocketmon = "피카츄"
            labelEnemyPocketmonStatus.text = "피카츄 [ HP: \(enemyPika.hp) / TYPE: \(enemyPika.type) ]"
        case "라이츄":
            print("라이츄 선택!")
            selectedEnemyPocketmon = "라이츄"
            labelEnemyPocketmonStatus.text = "라이츄 [ HP: \(enemyRai.hp) / TYPE: \(enemyRai.type) ]"
        case "파이리":
            print("파이리 선택!")
            selectedEnemyPocketmon = "파이리"
            labelEnemyPocketmonStatus.text = "파이리 [ HP: \(enemyPariry.hp) / TYPE: \(enemyPariry.type) ]"
        default:
            print("에러! - enemyPocketmon")
        }
        
    }
    
    // MARK: 공격 번호 버튼 액션 정의
    @IBAction func buttonSelectedAttack(_ sender: UIButton) {
        guard let attackNumber = sender.currentTitle else { //currentTitle -> String?
            print("ERROR-")
            return
        }
        print(attackNumber)
        
        selectedAttackNumber = Int(attackNumber)
        //labelAttackStatus.text = attackNumber
        
        // 피카츄로 스킬 네임과 스킬 데미지를 라벨에 출력까지 하는 함수
        // 선택한 몬스터로 출력하고 싶은데, Switch 문을 쓰지 않고 하는 방법을 알고 싶다.
        let printSkillName:String = pika.returnSkillNameOf(number: (selectedAttackNumber!-1))
        let printSkillDamage:Int = pika.returnSkillDamageOf(number: (selectedAttackNumber!-1))
        labelAttackStatus.text = "\(printSkillName) - damage: \(printSkillDamage)"
        
    }
    
    // MARK: 공격하기 버튼 액션 정의
//    @IBAction func buttonAttackAction(_ sender: UIButton) {
//        guard let valueButton = labelAttackStatus.text else {
//            print("공격 타입 미설정 상태")
//            labelAttackStatus.text = "공격 스킬을 먼저 선택해주세요."
//            
//            return
//        }
//        print(valueButton) // = 에러!
//    }

    @IBAction func buttonAttackAction(_ sender: UIButton) {
        guard let valueButton = labelAttackStatus.text else {
            print("ERROR-")
            return
        }
        
        if selectedAttackNumber == nil {
            print("공격 타입 미설정 상태")
            labelAttackStatus.text = "공격 스킬을 먼저 선택해주세요."
        }
        
        print(valueButton)
    }
    

    // MARK: 필수 함수
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
