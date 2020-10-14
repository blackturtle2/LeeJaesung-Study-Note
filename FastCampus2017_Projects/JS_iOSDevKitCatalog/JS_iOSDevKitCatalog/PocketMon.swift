//
//  Monster.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 18..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class PocketMon {
    let name:String
    let type:String
    var hp:Int = 100
    var skills:[[String:Any]]?
    var myOwner:Trainer?
    
    init(name:String, type:String) {
        self.name = name
        self.type = type
    }
    
    func attack(toMonster monster:PocketMon, skill skillNum:Int) {
        if let skillList = skills {
            let targetName:String = monster.name
            let skill:[String:Any] = skillList[skillNum]
            let skillName:String = skill["name"] as! String
            let skillDamage:Int = skill["damage"] as! Int
            
            print("`\(self.name)` -> `\(targetName)` : \(skillName)(\(skillDamage))으로 공격합니다.")
            
            if (monster.hp - skillDamage) < 0 {
                print("* `\(targetName)` -> 죽었습니다.")
                monster.hp = 0
            }else {
                monster.hp -= skillDamage
            }
            
            print("`\(self.name)` - HP: \(self.hp) \r`\(targetName)` - HP: \(monster.hp)\r")
            
        }else {
            print(" = FAIL = ")
        }
    }
    
    func returnSkillNameOf(number num:Int) -> String {
        guard let vSkillList = skills else { print("ERROR- vSkillList"); return "" }
        
        if num >= vSkillList.count {
            return "\(num+1)번 공격이 없습니다."
        }else {
            let skillElement:[String:Any] = vSkillList[num]
            
            return skillElement["name"] as! String
        }
    }
    
    func returnSkillDamageOf(number num:Int) -> Int {
        guard let vSkillList = skills else { print("ERROR- vSkillList"); return 0 }
        
        if num >= vSkillList.count {
            return 0
        }else {
            let skillElement:[String:Any] = vSkillList[num]
            
            return skillElement["damage"] as! Int
        }
    }
}
