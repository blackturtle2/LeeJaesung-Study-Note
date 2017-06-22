//
//  Student.swift
//  Practice0517
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class Student {
    let name:String
    var average:Double?
    var subjects:[Subject]?
    
    init(name:String) {
        self.name = name
    }
    
    func add(subjectName name:String, score:Int) {
        if subjects == nil {
            subjects = []
        }
        
        let sb:Subject = Subject(name: name, score: score)
        subjects!.append(sb)
    }
}
