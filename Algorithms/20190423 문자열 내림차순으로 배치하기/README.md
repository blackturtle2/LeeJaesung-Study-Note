# 문자열 내림차순으로 배치하기
- 2019.04.23 화요일
- 난이도: 하
- 걸린 시간: 약 5분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12917](https://programmers.co.kr/learn/courses/30/lessons/12917)
- 문자열 s의 문자를 큰것부터 작은 순으로 정렬.
- 새로운 문자열 리턴.
- 대문자는 소문자보다 작은 것으로 간주.

## Solution

```swift
import Foundation

func solution(_ s:String) -> String {
//    return s.sorted(by: {$0 > $1}).reduce("") {"\($0)"+"\($1)"}
    return String(s.sorted(by: {$0 > $1}))
}

print("RESULT: ", solution("Zbcdefg")) // "gfedcbZ"

```

## Study
- `String() 안에 String 배열을 넣으면, 알아서 String으로 뽑아진다. 그걸 깨닫고, 채점 후에 reduce를 제거하는 코드로 수정.

```swift
	s.sorted(by: >)
	s.sorted {$0 > $1}
```
- 클로져를 축약하는 방법에는 여러가지가 있다.
- `(by: >)`와 같은 식으로 축약하는 방법이 가장 간단해보인다. 중괄호인 `{`와 `}`를 생략 가능하다.
- 또는 `sorted { $0 > $1 }`와 같이 by를 생략하고, 로직만 설명하는 것도 가능하다.

---
***The end***