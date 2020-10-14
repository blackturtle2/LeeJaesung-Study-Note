//
//  Pairi.swift
//  RepeatExample
//
//  Created by youngmin joo on 2017. 5. 18..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

class Pairi {
    var name:String
    var hp:Int = 120
    var type:String = "불꽃"
    var skills:[[String:Any]] = [["name":"불꽃세레","demage":20],["name":"할퀴기","demage":10]]
    
    
    init() {
        
        name = "파이리"
    }
    
    func attck(toMoster monster:Pairi, skill skillNum:Int)
    {
        
        let skill:[String:Any] = skills[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅*/
        print("\(self.name)이 \(monster.name)에게 \(skillName)으로 공격합니다.")
        
        let skillDemage:Int = skill["demage"] as! Int
        monster.hp -= skillDemage
        
    }
    
    
}
