// https://programmers.co.kr/learn/courses/30/lessons/12901

import Foundation

// 2016년 1월 1일은 금요일
// 2016년 a월 b일은 무슨 요일?
// SUN, MON, TUE, WED, THU, FRI, SAT

func solution(_ a:Int, _ b:Int) -> String {
    let weekdays = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    var daysFromLastMonth = 0
    var i = 0
    while i < a - 1 {
        daysFromLastMonth += monthDays[i]
        i += 1
    }

    return weekdays[(daysFromLastMonth + b) % 7]
}

print("RESULT: ", solution(5, 24)) // "TUE"
print("RESULT: ", solution(1, 8)) // "FRI"


// reduce 사용해서 다시 풀어보기
func newSolution(_ a:Int, _ b:Int) -> String {
    let weekdays = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDays = (monthDays[0..<a-1].reduce(0) { $0 + $1 } + b) % 7

    return weekdays[totalDays]
}

print("RESULT: ", newSolution(5, 24)) // "TUE"
print("RESULT: ", newSolution(1, 8)) // "FRI"
