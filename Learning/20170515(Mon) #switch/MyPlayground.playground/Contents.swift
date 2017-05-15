//: Playground - noun: a place where people can play

import UIKit

// 시험 점수를 받아서 해당 점수의 등급(Grade)을 반환해주는 함수
// *Grade = A+, A, B+, B, C+, ...

func grade(fromPoint point:Int) -> String{
    var gradeValue:String = "F"
    
    switch point {
    case 95...100:
        gradeValue = "A+"
    case 90..<95:
        gradeValue = "A"
    case 85..<90:
        gradeValue = "B+"
    case 80..<85:
        gradeValue = "B"
    case 75..<80:
        gradeValue = "C"
    default:
        gradeValue = "F"
    }
    
    return gradeValue
}
//print(grade(fromPoint: 89))



// Grade 받아서 Point로 변환해주는 함수
// Point = 4.5, 4.0, 3.5, 3.0, ...

func makePoint(fromGrade grade:String) -> Double{
    var resultPoint:Double = 0
    
    switch grade {
    case "A+":
        resultPoint = 4.5
    case "A":
        resultPoint = 4.0
    case "B+":
        resultPoint = 3.5
    case "B":
        resultPoint = 3.0
    case "C":
        resultPoint = 2.5
    case "D":
        resultPoint = 2.0
    default:
        resultPoint = 0
    }
    
    return resultPoint
}
//print(makePoint(fromGrade: "A"))

print("이번 학기 총 점수는 \(makePoint(fromGrade: grade(fromPoint: 88)))")

