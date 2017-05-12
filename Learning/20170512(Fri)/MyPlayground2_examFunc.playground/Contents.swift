//: Playground - noun: a place where people can play

import UIKit

// 예제 - 시험 점수를 받아서 해당 점수의 등급(Grade)를 반환해주는 함수
func examResult(of score:Int) -> String {
    var result:String = "F"
    
    if ( score < 100 && score >= 95 ) {
        result = "A+"
    }else if ( score < 95 && score >= 90 ) {
        result = "A"
    }else if ( score < 90 && score >= 85 ) {
        result = "B"
    }else if ( score < 85 && score >= 80 ) {
        result = "C"
    }else {
        result = "error"
    }
    return result
    
}

// grade를 point로 반환.
func gradeToPoint(of grade:String) -> Double {
    var result:Double = 0
    
    if grade == "error" {
        result = 0
    }else if grade == "A+" {
        result = 4.5
    }else if grade == "A" {
        result = 4.0
    }else if grade == "B" {
        result = 3.5
    }else if grade == "B+" {
        result = 3.0
    }else if grade == "C" {
        result = 2.5
    }else if grade == "D" {
        result = 2.0
    }
    
    return result
}

// 점수를 받아서 point로 반환.
func scoreToPoint(of score:Int) -> Double {
    var result:Double = 0
    
    result = gradeToPoint(of: examResult(of: score))
    
    return result
}

// Grade를 프린트하는 함수 // 에러 처리
func printGrade(of result:Int){
    if (examResult(of: result) == "error") {
        print("Error- Please, typing exam's result")
    }else {
        print("Grade = \(examResult(of: result))")
    }
    
}
printGrade(of: 98) // = A+

func printPoint(of result:Int){
    if (scoreToPoint(of: result) == 0) {
        print("Error- Please, typing exam's result")
    }else {
        print("Point = \(scoreToPoint(of: result))")
    }
    
}
printPoint(of: 98)

