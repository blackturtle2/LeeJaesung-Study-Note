//
//  Status.swift
//  BaseballProject
//
//  Created by leejaesung on 2017. 5. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class Status {
    
    var out:Int = 0
    var ball:Int = 0
    var strike:Int = 0
    
    func setFree() {
        self.out = 0
        self.ball = 0
        self.strike = 0
    }
    
}
