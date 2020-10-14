//
//  Mraichu.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 18..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class MonKkobugi: PocketMon {
    init() {
        super.init(name: "꼬부기", type: "물")
        
        hp = 200
        skills = [["name":"물대포","damage":30],
                  ["name":"몸통박치기","damage":20],
                  ["name":"할퀴기","damage":15]]
    }
    
    
}
