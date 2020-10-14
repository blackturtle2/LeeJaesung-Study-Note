//
//  Charmander.swift
//  ClassPocketmon
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class MonPariry:PocketMon {
    init() {
        super.init(name: "파이리" , type: "불")
        
        hp = 130
        skills = [["name":"불꽃세례","damage":20],
                  ["name":"파이어볼","damage":40],
                  ["name":"할퀴기","damage":15]]
    }
    
    
}
