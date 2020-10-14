//: Playground - noun: a place where people can play

import UIKit

// - 변수 예제 시작 -

// 다양한 변수를 만들어 봅시다.
// 이름, 나이, 성별, 학교, 직업, 연봉 등
// 다른 타입으로 30개의 변수(상수) 작성하기.

var name:String = "Leejaesung"
var age:Int = 30
var school:String = "Incheon"
var job:String = "Developer"

var bestMovie:String = "a"
var bestSong:String = "a"
var bestCar:String = "a"

var loveOfMyLife:(a:String, b:String, c:String) = ("a","a","a")

var bestTrip3:(String, String, String) = ("Newyork", "London", "Paris")
var tripFriend:(name:String, age:Int, location:String) = ("leejaesung", 30 , "Seoul")

print("저는 \(tripFriend.name) 와 여행을 갈 계획입니다.")
print("\(tripFriend.name) 의 나이는 \(String(tripFriend.age)) 이고, \(tripFriend.location)에서 출발할 예정입니다.")

//print("나의 여행 베스트3는 \(bestTrip3) 입니다.")

//print("여행자 상세 정보: \(tripFriend)")

bestMovie = "Finding Nemo"
bestSong = "I believe"
bestCar = "Porche"

print("나의 베스트 영화는 '\(bestMovie)'이고, 베스트 노래는 '\(bestSong)'이며, 베스트 자동차는 '\(bestCar)'입니다.")

print("")
// - 변수 예제 끝 -


// 이름을 출력하는 함수를 만들어 봅시다.
func printf(name printStr:String) -> Int
{
    print(printStr)
    return 0;
}
print("이름 출력 함수 결과 = ")
printf(name: "lee")

print("")


// 더하기 함수를 만들어 봅시다.
func addInt(num1 firstNum:Int, num2 secondNum:Int) -> Int
{
    return firstNum + secondNum
}
var totalNum:Int = addInt(num1: 128, num2: 256)
print("더하기 함수 결과 = \(totalNum)")

print("")


// 매개변수를 넣지 않고, 평균을 계산
func average() -> Double
{
    return Double(totalNum/2)
}
var averageNum = average()
print("평균 함수 결과 = \(averageNum)")

print("")


// 빼기 함수를 만들어 봅시다.
func minusInt(num1 firstNum:Int, num2 secondNum:Int) -> Int
{
    return firstNum - secondNum
}
var total:Int = minusInt(num1: 2, num2: 4)
print("빼기 함수 결과 = \(total)")

print("")


// 자기소개용 함수를 만들어 봅시다.
func letMeIntroduce(job:String, name:String, age:Int, home:String) -> Int
{
    print("안녕하세요. 저는 \(job)하는 \(name)입니다. 나이는 \(age)이며, 사는 곳은 \(home)입니다. 반갑습니다.")
    return 0
}

print("자기소개 함수 결과 = ")
letMeIntroduce(job: "development", name: "kim", age: 25, home: "Newyork")

print("")


// 예제 - "inout"
func swapTwoInts(_ a: inout Int, _ b: inout Int) -> Int
{
    let tempA = a
    a = b
    b = tempA
    
    return b
}
var someInt = 3
var anotherInt = 107
var totalInt = swapTwoInts(&someInt, &anotherInt) //결과는 3
print("inout 예제 결과 = ")
print("\(someInt) , \(anotherInt)") //결과는 107 , 3

print("")


// 예제 따라하기 - "여러가지 함수 - 매개변수"
print("함수와 매개변수 예제 결과 = ")
func getNumber(firstNum num1:Int) -> Int {
    return num1
}
print("A: \(getNumber(firstNum: 10))")


func getNumber(num1:Int) -> Int{
    return num1
}
print("B: \(getNumber(firstNum: 10))")

func getNumber() -> Int{
    var num1:Int = 22
    return num1
}
print("C: \(getNumber(firstNum: 10))")

func getNumber(firstNum num1:Int, secondNum num2:Int) -> Int{
    return num1 + num2
}
print("D: \(getNumber(firstNum: 10, secondNum: 20))")

func sumNumber(num1:Int, num2:Int = 5) -> Int{
    return num1 + num2
}
print("E: \(sumNumber(num1: 10, num2: 20))")

print("")
