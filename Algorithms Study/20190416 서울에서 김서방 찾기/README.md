# 서울에서 김서방 찾기
- 2019.04.16
- 난이도: 하
- 걸린 시간: 약 10분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12919](https://programmers.co.kr/learn/courses/30/lessons/12919)
- String 배열에서 "Kim"이 들어간 index를 가지고 문자열을 만들어서 반환한다.

## Solution

```swift
import UIKit

func solution(_ seoul: [String]) -> String {
    var i = 0
    for item in seoul {
        if item == "Kim" { break }
        i += 1
    }
    return "김서방은 \(i)에 있다"
}

print("RESULT: ", solution(["Jane", "Kim"])) // "김서방은 1에 있다"

func newSolution(_ seoul: [String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

print("RESULT: ", newSolution(["Jane", "Kim"])) // "김서방은 1에 있다"
```
- `newSolution()`이 맞는데, 프로그래머스의 컴파일러가 `Swift 4.1.2`이여서 제대로 돌아가지 않았다.

## Study
- 기존에 `array.index(of: )`를 사용했었으나 Swift 4.2부터 deprecated 되었고, `firstIndex(of: )`와 `lastIndex(of: )`를 활용하도록 한다.


---
***The end***