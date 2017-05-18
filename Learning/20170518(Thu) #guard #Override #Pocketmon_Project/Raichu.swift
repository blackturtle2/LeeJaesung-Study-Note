//
//  Raichu.swift
//  RepeatExample
//
//  Created by youngmin joo on 2017. 5. 18..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation


class Raichu:Pikachu {
    
    override init() {
        super.init(name: "라이츄", type: "전기")
        hp = 210
        skills = [["name":"10만볼트","demage":100],["name":"몸통박치기","demage":20]]
        
    }
    
    override func playCute()
    {
        guard let onwer = onwerTrainer else
        {
            return
        }
        //-----------------------------------------------//
        print(onwer.name + "에게 재롱을 피다가 혼났습니다.")
        hp -= 10
    }
    
    override func evolution() -> Raichu {
        return self
    }
    
    func isImmuneElectoric(forMonster monster:PoketMon) -> Bool {
        if monster.type == "전기" {
            return true
        }else
        {
            return false
        }
        
    }
    
}
