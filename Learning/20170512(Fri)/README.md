# 패스트캠퍼스 강의 노트 5th ( 20170512 )

## ( 복습 ) 함수의 문법 ( Powered by 조교님 )
```swift
func addTwoNum(firstNumb num1:Int, secondNumb num2:Int) -> Int{
    return num1 + num2
}
var result1:Int = addTwoNum(firstNumb: 1, secondNumb: 2)
```
 - `firstNumb`가 "외부 이름", `num1`이 "내부 이름"이라고 불렀..습니다. ( via Objective-C )
 - 내부 이름은 함수 안에서만 사용할 수 있습니다.
 
```swift
func square(of number:Int) -> Int{
    return number * number
}
var result2:Int = square(of: 5) // = 25
```
 - `result2`에서 함수를 사용할 때, `square(of: 5)`처럼 **인간의 언어**와 유사하게 사용할 수 있는 것이 swift에서 외부 이름을 사용하는 이유입니다.

---

# 조건문

## if-else문 / else-if문

```swift
if 조건1 {
 //조건1이 true일 때의 액션
}else if 조건2 {
 //조건1이 false이고, 조건2가 true일 때의 액션
}else{
 //조건1, 조건2가 false일 때의 액션
}
```

## 연산자
### 산술 연산자
1. 더하기 `+`
2. 빼기 `-`
3. 곱하기 `*`
4. 나누기 `/`
5. **나머지** `%` //나머지는 정수에서만 사용할 수 있습니다.

### 비교 연산자
1. 같다 `A == B`
2. 크거나 같다 `A >= B`
3. 작거나 같다 `A <= B`
4. 크다 `A > B`
5. 작다 `A < B`


### 논리 연산자
1. 둘 다 참이어야 참이다 `A && B` // AND 기호
2. 둘 중 하나만 참이어도 참이다 `A || B` // OR 기호
3. 반대이다 `!(A || B)`

### 복합 연산자
1. A에 값을 더하기 `A += 1` // 자기 자신에게 연산하는 것인데, `A = A + 1`이라고 쓸 필요가 없습니다.
2. B에 값을 빼기 `B -= 1`

### 범위 연산자
1. A부터 B까지 `A...B`
2. A부터 B까지이지만, B는 포함하지 않는다 `A..<B`


## 예제 - if / else if / 연산자
```swift
// 짝수 여부를 확인하는 함수.
func isEven(number num:Int) -> Bool {
    if num % 2 == 0{
        return true
    }else{
        return false
    }
}
let evenNumber:Bool = isEven(number: 23482034980)
print(evenNumber) // = true
```
 - 결과: `true`
 - 짝수 여부를 확인하기 위해 산술 연산자, `나머지(%)`를 활용한다.

```swift
// 소개팅 가능 여부 체크하는 함수.
// 사람의 키와 몸무게, 자산(...)을 받아서 소개팅을 나갈지 말지 고민하는 함수를 설계한다.
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
```
 - 결과: `true`
 - 튜플의 조건에 따른 `else if`문의 활용.
 - 논리 연산자는 2개를 비교할 수 있다고 생각하고, 설계한다.

```swift
// 두개의 수를 받아서 뺀 결과를 출력하는 함수.
// 만약, 뒤의 수가 크다면, 두 수를 스위치하고 뺀다.
func minus(firstNum num1:Int, secondNum num2:Int) -> Int {
    var vNum1:Int = num1
    var vNum2:Int = num2
    
    if vNum2 >= vNum1 {
        swapToInt(&vNum1, &vNum2)
    }
    
    return vNum1 - vNum2
}

// 두개의 매개변수를 받아서 서로 값을 바꾼다.
func swapToInt(_ num1:inout Int, _ num2:inout Int){
    let temp:Int = num1
    num1 = num2
    num2 = temp
}

minus(firstNum: 5, secondNum: 2) // = 3
```
 - 결과: `3`
 - 함수의 매개변수는 상수 값이므로 절대 바뀔 수 없다.
 - 함수 정의에서 변수를 선언하고, 매개변수를 보관한다. `var vNum1:Int = num1`
 - `if`문 안에서 선언된 변수는 if문이 끝나면, **증발**된다. (...)


--


## 연습문제 - 시험 점수를 Grade와 Point로 변환하는 프로그램
```swift
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
```
 - 예외처리: 사용자가 101점을 입력했을 경우의 에러 처리는 grade 함수나 point 함수가 아닌 그 함수를 실제로 사용하는 액션에서 차단하면 좋다. (grade, point 함수 그 자체는 무결점하게 만든다.)

## 연습문제 - 홀짝 계산
```
//홀짝 프린트 함수(홀수 인지 짝수인지 확인)
func evenof(number input:Int) -> Bool {
    let vInput:Int = input
    var result:Bool = false
    
    if (vInput % 2) == 1 {
        result = false
    }else {
        result = true
    }
    
    return result
}
print("입력한 수의 짝수 여부는? = \(evenof(number: 3))") // = false
```

## 연습문제 - 절대값 계산
```
//절대값 프린트.
func checkAbsolute(of input:Int) -> Int {
    var vInput:Int = input
    
    if vInput < 0 {
        vInput *= -1
    }
    
    return vInput
}
print("입력한 수의 절대값은? = \(checkAbsolute(of: -105))") // = 105
```

## 연습문제 - 영화표 값 계산하는 프로그램
```
//영화표값 계산하기.
//기본가격 :        9000원
//10시까지 조조 :   -10%
//청소년 :         -10%
//argument : 영화시간(24시간제), 성인인원, 청소년인원.
func mTicketPrice(startTime time:Int, adultCount aCount:Int, teenagerCount tCount:Int) -> Int {
    let basicPrice:Int = 9000
    var adultPrice:Int = 0
    var teensPrice:Int = 0
    
    if aCount > 0 || tCount > 0 {
        if time <= 10 {
            adultPrice = basicPrice * aCount * 90 / 100 //조조할인 할인 0.9
        }else {
            adultPrice = basicPrice * aCount
        }
        teensPrice = basicPrice * tCount * 90 / 100 //청소년 할인 0.9
    }
    
    return adultPrice + teensPrice
}
print("총 영화표 값은? = \(mTicketPrice(startTime: 11, adultCount: 1, teenagerCount: 1))")
```

## 연습문제 - 지폐 개수 계산하는 프로그램
```
//지폐별 갯수
//금액을 입력받고 100원, 500원, 1,000원, 5,000원, 10,000원, 50,000원권으로 각각 몇 장씩 나눠지는지 프린트.
func countChanges(forMoney money:Int) -> (count50000w: Int, count10000w:Int, count5000w:Int, count1000w:Int, count500w:Int, count100w:Int) {
    var vMoney:Int = money
    var result:(count50000w: Int, count10000w:Int, count5000w:Int, count1000w:Int, count500w:Int, count100w:Int) = (0, 0, 0, 0, 0, 0) // 6개
    
    if vMoney >= 50000 {
        result.count50000w = vMoney / 50000
        vMoney %= 50000
    }
    if vMoney >= 10000 {
        result.count10000w = vMoney / 10000
        vMoney %= 10000
    }
    if vMoney >= 5000 {
        result.count5000w = vMoney / 5000
        vMoney %= 5000
    }
    if vMoney >= 1000 {
        result.count1000w = vMoney / 1000
        vMoney %= 1000
    }
    if vMoney >= 500 {
        result.count500w = vMoney / 500
        vMoney %= 500
    }
    if vMoney >= 100 {
        result.count100w = vMoney / 100
        vMoney %= 100
    }
    
    return result
}
 //(count50000w: 1, count10000w: 1, count5000w: 1, count1000w: 1, count500w: 1, count100w: 1)

func printOf(changes money:Int) -> Int {
    print("입력한 금액[\(money)원]의 지폐별 개수는?\r - 50,000원: \(countChanges(forMoney: money).count50000w)개 / 10,000원: \(countChanges(forMoney: money).count10000w)개 / 5,000원: \(countChanges(forMoney: money).count5000w)개 / 1,000원: \(countChanges(forMoney: money).count1000w)개 / 500원: \(countChanges(forMoney: money).count500w)개 / 100원: \(countChanges(forMoney: money).count100w)개\r")
    
    return 0
}
printOf(changes: 666000)
```

## 연습문제 - 윤년 계산하는 프로그램
```
//윤년구하기
//서력 기원 연수가 4로 나누어떨어지는 해는 윤년으로 한다.(2004년, 2008년, 2012년, 2016년, 2020년, 2024년 …)
//이 중에서 100으로 나누어떨어지는 해는 평년으로 한다.(1900년, 2100년, 2200년, 2300년, 2500년 …)
//그중에 400으로 나누어떨어지는 해는 윤년으로 둔다.(1600년, 2000년, 2400년 …)
//연도를 입력받고 윤년인지 평년인지 프린트.

func checkLeapYear(of year:Int) -> Bool {
    var result:Bool = false
    
    if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) {
        result = true
    }
    
    return result
}
print("입력한 해의 윤년 여부는? = \(checkLeapYear(of: 2004))") // = true
```

---
## 과제 1
```
//(정)사각형의 넓이 구하는 함수 만들기
//argument : width(가로), length(세로).

//원의 넓이 구하는 함수 만들기
//argument : radius(반지름)

//삼각형의 넓이 구하는 함수 만들기
//argument : base(밑변), height(높이)

//사다리꼴의 넓이 구하는 함수 만들기
//argument : base(밑변), top(윗변), height(높이)

//(정)육면체의 부피 구하는 함수 만들기
//argument: width(가로), length(세로), height(높이)

//원기둥의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)

//구체의 부피 구하는 함수 만들기
//argument : radius(반지름)

//원뿔의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
```
## 과제 2
```
//1. inch to cm, cm to inch (2개)
//2. m2 to 평, 평 to  m2 (2개)
//3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
//4. 데이터량 (KB to MB, MB to GB) (2개)
//5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
//ex) 11320 >> 4400초
```

---
### 문서 끝 ( by 재성 )