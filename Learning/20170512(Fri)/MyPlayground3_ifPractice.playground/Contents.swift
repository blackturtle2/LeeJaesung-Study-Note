//: Playground - noun: a place where people can play

import UIKit

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



//절대값 프린트.
func checkAbsolute(of input:Int) -> Int {
    var vInput:Int = input
    
    if vInput < 0 {
        vInput *= -1
    }
    
    return vInput
}
print("입력한 수의 절대값은? = \(checkAbsolute(of: -105))") // = 105



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
print("입력한 해의 윤년 여부는? = \(checkLeapYear(of: 2004))")


