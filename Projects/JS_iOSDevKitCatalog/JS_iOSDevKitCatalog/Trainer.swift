//
//  Trainer.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 18..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class Trainer {
    
    var name:String
    var myPocketmon:[String]?
    
    init(name:String) {
        self.name = name
    }
    
    func isCatchMonsterOf(monster:PocketMon) -> Bool {
        var result:Bool = false
        
        if monster.hp <= 50 {
            self.myPocketmon?.append(monster.name)
            result = true
            print("몬스터 잡기에 성공했다! \(monster.name) 획득!")
        }else {
            print("몬스터 잡기에 실패했다!")
        }
        return result
    }
    
}
