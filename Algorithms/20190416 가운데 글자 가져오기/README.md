# 가운데 글자 가져오기
- 2019.04.16
- 난이도: 하
- 걸린 시간: 약 15분
- 문제 링크: [https://programmers.co.kr/learn/courses/30/lessons/12903](https://programmers.co.kr/learn/courses/30/lessons/12903)

## Problem
- String이 주어지고, 가운데 글자를 리턴한다.
- 주어진 문자열이 짝수개이면, 가운데 글자는 2개가 된다.

## Solution

```swift
func solution(_ s: String) -> String {
    let arrString = s.map { $0 }

    return arrString.count % 2 == 1 ? "\(arrString[(arrString.count - 1) / 2])" : "\(arrString[(arrString.count - 1) / 2])\(arrString[(arrString.count - 1) / 2 + 1])"
}

print("RESULT 1: ", solution("abcde")) // "c"
print("RESULT 2: ", solution("qwer")) // "we"


func newSolution(_ s: String) -> String {
    return Array(s).count % 2 == 0 ? "\(Array(s)[(s.count-1)/2])\(Array(s)[(s.count-1)/2 + 1])" : "\(Array(s)[(s.count-1)/2])"
}

print("RESULT 1: ", newSolution("abcde")) // "c"
print("RESULT 2: ", newSolution("qwer")) // "we"
```
- `newSolution()`은 다른 사람의 해설을 보고, 다시 손을 본 솔루션.

## Study
- `String` 자체가 문자열이므로, `s.map { }` 과 같은 구현이 가능하다.
- `s.count` 를 이용해 문자열의 길이를 알 수 있다.
- `Array()` 함수를 이용해 배열을 만들 수 있는데, 이 때 `Array(String)`으로 문자열의 캐릭터가 들어가 있는 배열을 만드는 것이 가능하다.


---
***The end***