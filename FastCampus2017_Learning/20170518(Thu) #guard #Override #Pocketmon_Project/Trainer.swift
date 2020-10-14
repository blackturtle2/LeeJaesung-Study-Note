//
//  Trainer.swift
//  RepeatExample
//
//  Created by youngmin joo on 2017. 5. 18..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

class Trainer {
    var myPoketMons:[PoketMon] = []
    var name
    
    init(name:String) {
        self.name = name
    }

    func catchPoketMon(targetMonster monster:PoketMon) {
        myPoketMons.append(monster)
        monster.onwerTrainer = self
    }
    
}
