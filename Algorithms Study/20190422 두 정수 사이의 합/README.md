# 두 정수 사이의 합
- 2019.04.22 Mon
- 난이도: 하
- 걸린 시간: 약 15분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12912](https://programmers.co.kr/learn/courses/30/lessons/12912)
- // a와 b 사이에 속한 모든 정수의 합을 리턴.
- // 3, 5 --> 3 + 4 + 5 = 12

## Solution

```swift
func solution(_ a:Int, _ b:Int) -> Int64 {
    let newA = a >= b ? a : b
    let newB = b <= a ? b : a

    var result = 0
    for item in newB...newA {
        result += item
    }

    return Int64(result)
}
```
- 생각나는대로 for문을 돌려서 풀어본 솔루션.

## Study
```swift
func newSolution(_ a:Int, _ b:Int) -> Int64 {
    let arr = a < b ? Array.init(a...b) : Array.init(b...a)

    return Int64(arr.reduce(0,+))
}

func newnewSolution(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array(a < b ? a...b : b...a).reduce(0,+))
}
```
- 앞 문제에서 활용한 `reduce`를 이용해 풀이.
- Array를 만들 때, `Array(a...b)`를 이용할 수 있다. 이 때, a보다 b가 당연히 커야한다.
- Array init 안에서 조건을 주고, 만들 수 있다는 것을 깨닫고 만든 솔루션이 `newnewSolution()`

---
***The end***