# 문자열 내 마음대로 정렬하기
- 2019.04.22 Mon
- 난이도: 중
- 걸린 시간: 약 45분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12915](https://programmers.co.kr/learn/courses/30/lessons/12915)
- // 문자열 string 배열, 정수 n.
- // 각 문자열의 n번째 글자를 기준으로 오름차순 정렬.

## Solution

```swift
func solution(_ strings: [String], _ n: Int) -> [String] {
    let s = strings.reduce(into: [String: Character]()) { $0[$1] = Array($1)[n] }
    return s.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value}.map({ $0.key })
}
```

## Study
- `reduce()`와 `sorted()`의 조합으로 문제 해결.
- array를 특정 로직으로 dictionary로 변환(?)하고자 할 때는 `reduce()`가 간단하다.
- `array.reduce(into: [String: String]()) { ... }`와 같은 식으로 초기값을 세팅할 때, dictionary를 먼저 초기화해주고, Closure에서 로직을 추가하면 된다.
- 이 때, 로직에서는 `$0[key] = value`와 같은 식으로 이미 초기값 단계에서 만들어진 dictionary의 특정 key 값에 value를 추가하는 형태로 구현한다.
- 위 코드를 한줄로 해결하고자 했는데, 자꾸 sorted 단계에서 걸려버려서 `s` 변수를 만들어서 해결했다. ~~너무 꼬아두면 안되는건가..~~

---
***The end***