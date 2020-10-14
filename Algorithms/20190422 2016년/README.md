# 2016년
- 2019.04.22 Mon
- 난이도: 하
- 걸린 시간: 약 15분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12901](https://programmers.co.kr/learn/courses/30/lessons/12901)
- 2016년 1월 1일은 금요일
- 2016년 a월 b일은 무슨 요일?
- SUN, MON, TUE, WED, THU, FRI, SAT

## Solution

```swift
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
```
- while 문을 이용한 반복문 처리로 해결.

## Study
```swift
func newSolution(_ a:Int, _ b:Int) -> String {
    let weekdays = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDays = (monthDays[0..<a-1].reduce(0) { $0 + $1 } + b) % 7

    return weekdays[totalDays]
}
```
- `reduce`를 활용해 while문보다 심플하게 해결.
- `monthDays[0..<a-1]`를 이용해서 `a-1` 인덱스까지의 배열을 도출한 다음, `reduce`를 사용해 해당 배열의 값들을 모두 더한다.
- 위 reduce 로직의 연산자는 중위 연산자로 왼쪽 값이 `$0`, 오른쪽 값이 `$1`임을 추론 가능하므로 `array.reduce(0, +)`와 같이 연산자 생략이 가능하다.

---
***The end***