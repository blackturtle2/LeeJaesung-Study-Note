//: Playground - noun: a place where people can play

import UIKit

// 함수의 문법 복습 예제
var numA:Int = 10

func addTwoNum(firstNumb num1:Int, secondNumb num2:Int) -> Int{
    return num1 + num2
}
var result1:Int = addTwoNum(firstNumb: 1, secondNumb: 2) // = 3

func square(of number:Int) -> Int{
    return number * number
}
var result2:Int = square(of: 5) // = 25

print("")
// 짝수를 구하는 함수
func isEven(number num:Int) -> Bool {
    if num % 2 == 0{
        return true
    }else{
        return false
    }
}
let evenNumber:Bool = isEven(number: 23482034980)
print(evenNumber)
print("")

// 소개팅 가능 여부 체크하는 함수
func isAbleMeeting(person:(height:Double, weight:Double, money:Int)) -> Bool {
    if (person.height >= 170 && person.weight <= 70) && person.money >= 2000 {
        print("무조건 소개팅!")
        return true
    }else if (person.height >= 170 && person.weight <= 70) || person.money >= 2000 {
        print("그럭저럭 소개팅")
        return true
    }else if (person.height >= 170) || (person.weight <= 70) || person.money >= 2000{
        print("받아는 볼게")
        return true
    }else {
        print("놉!")
        return false
    }
    return false
}
print("소개팅 가능 여부 체크 함수 결과 출력 = ")
isAbleMeeting(person: (175, 75, 3500)) //true


// 마이너스 예제
func minus(firstNum num1:Int, secondNum num2:Int) -> Int {
    var vNum1:Int = num1
    var vNum2:Int = num2
    
    if vNum2 >= vNum1 {
        swapToInt(&vNum1, &vNum2)
    }
    
    return vNum1 - vNum2
}

func swapToInt(_ num1:inout Int, _ num2:inout Int){
    let temp:Int = num1
    num1 = num2
    num2 = temp
}
minus(firstNum: 5, secondNum: 2) // = 3


