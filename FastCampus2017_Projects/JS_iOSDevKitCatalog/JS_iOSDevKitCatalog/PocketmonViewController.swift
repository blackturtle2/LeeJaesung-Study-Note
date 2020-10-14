//
//  ViewController.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class PocketmonViewController: UIViewController {
    
    /*
     주제: 내 포켓몬과 적 포켓몬 그리고 공격 타입을 선택해 공격하는 게임.
     클래스와 타입을 이해하는 것에 목적을 두었고, 동작에는 큰 이상이 없으나, 초기 설계를 잘못한 덕분에 불필요한 소스가 많아지고, 기획 목표까지 진행하지 못한 미완성의 프로젝트입니다.
     */
    
    @IBOutlet weak var labelMyPocketmonStatus: UILabel!
    @IBOutlet weak var labelEnemyPocketmonStatus: UILabel!
    @IBOutlet weak var labelAttackStatus: UILabel!
    
    var selectedAttackNumber:Int?
    var selectedMyPocketmon:String?
    var selectedEnemyPocketmon:String?

    let myPika:MonPikachu = MonPikachu()
    let myKkobu:MonKkobugi = MonKkobugi()
    let myPariry:MonPariry = MonPariry()
    let enemyPika:MonPikachu = MonPikachu()
    let enemyKkobu:MonKkobugi = MonKkobugi()
    let enemyPariry:MonPariry = MonPariry()
    

    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: ***** START *****
    
    // MARK: 내 포켓몬 선택 버튼 액션 정의
    @IBAction func buttonSelectedPocketmon(_ sender: UIButton) {
        guard let myPocketmon = sender.currentTitle else { print("ERROR- buttonSelectedPocketmon"); return }
        
        switch myPocketmon {
        case "피카츄":
            print("피카츄 선택!")
            selectedMyPocketmon = "pika"
            labelMyPocketmonStatus.text = "피카츄 ( HP: \(myPika.hp) / TYPE: \(myPika.type) )"
            labelAttackStatus.text = ""
        case "꼬부기":
            print("꼬부기 선택!")
            selectedMyPocketmon = "kkobu"
            labelMyPocketmonStatus.text = "꼬부기 ( HP: \(myKkobu.hp) / TYPE: \(myKkobu.type) )"
            labelAttackStatus.text = ""
        case "파이리":
            print("파이리 선택!")
            selectedMyPocketmon = "pariry"
            labelMyPocketmonStatus.text = "파이리 ( HP: \(myPariry.hp) / TYPE: \(myPariry.type) )"
            labelAttackStatus.text = ""
        default:
            print("ERROR- myPocketmon")
        }
    }
    
    // MARK: 적 포켓몬 선택 버튼 액션 정의
    @IBAction func buttonEnemyPocketmon(_ sender: UIButton) {
        guard let enemyPocketmon = sender.currentTitle else { print("ERROR- buttonEnemyPocketmon"); return }
        
        switch enemyPocketmon {
        case "피카츄":
            print("피카츄 선택!")
            selectedEnemyPocketmon = "pika"
            labelEnemyPocketmonStatus.text = "피카츄 ( HP: \(enemyPika.hp) / TYPE: \(enemyPika.type) )"
        case "꼬부기":
            print("꼬부기 선택!")
            selectedEnemyPocketmon = "kkobu"
            labelEnemyPocketmonStatus.text = "꼬부기 ( HP: \(enemyKkobu.hp) / TYPE: \(enemyKkobu.type) )"
        case "파이리":
            print("파이리 선택!")
            selectedEnemyPocketmon = "pariry"
            labelEnemyPocketmonStatus.text = "파이리 ( HP: \(enemyPariry.hp) / TYPE: \(enemyPariry.type) )"
        default:
            print("ERROR- enemyPocketmon")
        }
    }
    
    // MARK: 공격 번호 버튼 액션 정의
    @IBAction func buttonSelectedAttack(_ sender: UIButton) {
        guard let vSelectedMyPockemon = selectedMyPocketmon else { return labelAttackStatus.text = "내 포켓몬을 먼저 선택해주세요." }
        
        var strSkillName:String = ""
        var intSkillDamage:Int = 0
        
        switch vSelectedMyPockemon {
        case "pika":
            strSkillName = myPika.returnSkillNameOf(number: sender.tag-1)
            intSkillDamage = myPika.returnSkillDamageOf(number: sender.tag-1)
        case "kkobu":
            strSkillName = myKkobu.returnSkillNameOf(number: sender.tag-1)
            intSkillDamage = myKkobu.returnSkillDamageOf(number: sender.tag-1)
        case "pariry":
            strSkillName = myPariry.returnSkillNameOf(number: sender.tag-1)
            intSkillDamage = myPariry.returnSkillDamageOf(number: sender.tag-1)
        default:
            print("ERROR-")
        }
        
        labelAttackStatus.text = "\(strSkillName) ( Damage: \(intSkillDamage) )"
        
        selectedAttackNumber = sender.tag
    }
    
    // MARK: 공격 버튼 액션 정의
    @IBAction func buttonAttackAction(_ sender: UIButton) {
        guard let valueButton = labelAttackStatus.text else { return print("ERROR- buttonAttackAction") }
        if selectedAttackNumber == nil { labelAttackStatus.text = "공격 스킬을 먼저 선택해주세요." }
        
        switch selectedMyPocketmon! {
        case "pika":
            switch selectedEnemyPocketmon! {
            case "pika":
                myPika.attack(toMonster: enemyPika, skill: selectedAttackNumber! - 1)
            case "kkobu":
                myPika.attack(toMonster: enemyKkobu, skill: selectedAttackNumber! - 1)
            case "pariry":
                myPika.attack(toMonster: enemyPariry, skill: selectedAttackNumber! - 1)
            default:
                print("ERROR-")
            }
        case "kkobu":
            switch selectedEnemyPocketmon! {
            case "pika":
                myPika.attack(toMonster: enemyPika, skill: selectedAttackNumber! - 1)
            case "kkobu":
                myPika.attack(toMonster: enemyKkobu, skill: selectedAttackNumber! - 1)
            case "pariry":
                myPika.attack(toMonster: enemyPariry, skill: selectedAttackNumber! - 1)
            default:
                print("ERROR-")
            }
        case "pariry":
            switch selectedEnemyPocketmon! {
            case "pika":
                myPika.attack(toMonster: enemyPika, skill: selectedAttackNumber! - 1)
            case "kkobu":
                myPika.attack(toMonster: enemyKkobu, skill: selectedAttackNumber! - 1)
            case "pariry":
                myPika.attack(toMonster: enemyPariry, skill: selectedAttackNumber! - 1)
            default:
                print("ERROR-")
            }
        default:
            print("ERROR-")
        }
        
        print(valueButton)
    }
    
    
}
