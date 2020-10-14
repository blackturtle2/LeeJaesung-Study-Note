# 문자열 내 p와 y의 개수
- 2019.04.22 Mon
- 난이도: 하
- 걸린 시간: 약 15분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12916](https://programmers.co.kr/learn/courses/30/lessons/12916)
- // 대문자 소문자 섞여 있는 문자열 s
- // s에 p의 개수와 y의 개수를 비교해서 같으면, true / 다르면, false
- // p, y 둘다 하나도 없으면, 항상 true.
- // 개수를 비교할 때, 대문자 소문자를 구분하지는 않습니다.

## Solution

```swift
func solution(_ s:String) -> Bool {
    return Array(s).filter { $0 == "p" || $0 == "P" }.count == Array(s).filter { $0 == "y" || $0 == "Y" }.count
}
```

## Study
```swift
func newsolution(_ s:String) -> Bool {
    let arr = Array(s.lowercased())
    return arr.filter { $0 == "p" }.count == arr.filter { $0 == "y" }.count
}
```
- `String.lowercased()`로 소문자 배열을 만든 다음에 로직 진행.

---
***The end***