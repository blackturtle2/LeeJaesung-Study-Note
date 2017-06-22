//
//  Mraichu.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 18..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class MonRaichu: PocketMon {
    
    init() {
        super.init(name: "라이츄", type: "전기")
        hp = 200
        skills = [["name":"전기충격","damage":20],["name":"몸통박치기","damage":20], ["name":"십만볼트","damage":50],["name":"번개","damage":100]]
    }
    
    
}
