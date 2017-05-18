//
//  PoketMon.swift
//  RepeatExample
//
//  Created by youngmin joo on 2017. 5. 18..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation
class PoketMon {
    let name:String
    let type:String
    var hp:Int = 100
    
    var skills:[[String:Any]]?
    var exp:Int = 0
    var onwerTrainer:Trainer?
    
    
    init(name:String, type:String) {
        self.name = name
        self.type = type
    }
    
    func attck(toMoster monster:PoketMon, skill skillNum:Int)
    {
        if let skillList = skills {
        
            let skill:[String:Any] = skillList[skillNum]
            let skillName:String = skill["name"] as! String
            
            /* as : 다운 케스팅*/
            print("\(self.name)이 \(monster.name)에게 \(skillName)으로 공격합니다.")
            
            let skillDemage:Int = skill["demage"] as! Int
            monster.hp -= skillDemage
            
        }

    }
}
