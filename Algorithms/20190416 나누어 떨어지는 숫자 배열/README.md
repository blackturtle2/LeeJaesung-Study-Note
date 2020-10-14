# 나누어 떨어지는 숫자 배열
- 2019.04.16
- 난이도: 하
- 걸린 시간: 약 10분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/12910](https://programmers.co.kr/learn/courses/30/lessons/12910)
- divisor로 나누어 떨어지는 숫자들을 정렬해서 반환한다.

## Solution

```swift
import UIKit

func solution(_ arr: [Int], _ divisor: Int) -> [Int] {
    let result = arr.filter { $0 % divisor == 0 }.sorted()
    return result.count == 0 ? [-1] : result
}

print("RESULT 1: ", solution([5, 9, 7, 10], 5)) // [5, 10]
print("RESULT 2: ", solution([2, 36, 1, 3], 1)) // [1, 2, 3, 36]
print("RESULT 3: ", solution([3, 2, 6], 10)) // [-1]
```

## Study
- 다시 한번 정리.
- `map()`은 배열을 특정 로직을 통해 변환하여 새로운 배열로 만들고 싶을 때. count는 동일.
- `filer()`는 특정 로직을 통해 값들을 걸러내서 새로운 배열로 만들고 싶을 때. count는 줄어들거나 동일.
- `reduce()`는 특정 로직을 통해 값들을 하나로 합치고 싶을 때. count는 1.
- `sort()`는 정렬하고 싶을 때.
- `max()`는 최대값 / `min()`은 최소값.
- `shuffled()`는 배열을 섞고 싶을 때.
- `reversed()`는 배열을 거꾸로 하고 싶을 때.
- `randomElement()`도 있네? 랜덤한 값을 뽑아낼 때.

> 이제 map, filter, reduce는 closure 형태로 얼추 다루게 되는 것 같다. 알고리즘을 공부해야 하는 이유.

---
***The end***