//
//  ScoreManager.swift
//  Practice0517
//
//  Created by leejaesung on 2017. 5. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class ScoreManager {
    
    func average(forStudent student:Student) -> Double {
        
        var returnAverage:Double = 0.0
        
        if let subjects = student.subjects {
            var total:Int = 0
            
            for subject in subjects {
                total += subject.score
            }
            
            returnAverage = Double(total / subjects.count)
        }
        
        return returnAverage
    }
    
    func makeTotal(forstudent student:Student) -> Double {
        var resultTotal:Double = 0
        
        if let subjects = student.subjects {
            for subject in subjects {
                resultTotal += Double(subject.score)
            }
        }
        
        return resultTotal
    }
}
