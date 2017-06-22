//
//  Pikachu.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class MonPikachu: PocketMon {

    init() {
        super.init(name: "피카츄", type: "전기")
        hp = 110
        skills = [["name":"전기충격","damage":10],["name":"몸통박치기","damage":20]]
    }
    
    func playCute() {
        hp += 20
    }
    
}
