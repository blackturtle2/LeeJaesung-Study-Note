//
//  Pickchu.swift
//  RepeatExample
//
//  Created by youngmin joo on 2017. 5. 17..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation
//피카츄

class Pikachu :PoketMon { //피카츄
    
    //var skills:[[String:Any]] = [["name":"전기충격","demage":10],["name":"몸통박치기","demage":20]]
    
    init() {
       super.init(name: "피카츄", type: "전기")
        hp = 110
        skills = [["name":"전기충격","demage":10,"property":"전기"],["name":"몸통박치기","demage":20,"property":"노멀"]]
    }
    
    override init(name: String, type: String) {
        super.init(name: name, type: type)
    }
    
    
    func playCute()
    {
        guard let onwer = onwerTrainer else
        {
            return
        }
 //-----------------------------------------------//
        print(onwer.name + "에게 재롱을 피기")
        hp += 30
        
    }
    
    func ifSurf(taget monsterSkill:[String:String]) -> Bool {
        //기술 회피용
        let skillName:String = monsterSkill["name"]!
        if skillName == "홍수" {
            return true
        }else
        {
            return false
        }
    }
    
    func evolution() -> Raichu? {
    
        if exp >= 100 {
            let newRaichu:Raichu = Raichu()
            return newRaichu;
        }
        
        return nil
    }
    
}


