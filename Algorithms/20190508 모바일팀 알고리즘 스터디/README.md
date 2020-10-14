# 소수찾기 (WIP)
// 난이도가 높아서 보류중..

- 2019.04.25 목요일
- 난이도: 상
- 걸린 시간: 약 10분

## Problem
* [https://programmers.co.kr/learn/courses/30/lessons/12918](https://programmers.co.kr/learn/courses/30/lessons/12918)
*  문자열 s의 길이가 4 혹은 6.
*  숫자로만 구성되어 있는지 확인하는 함수 구현.
*  s는 길이 1 이상, 8 이하인 문자열.


## Solution

```swift
import Foundation

func solution(_ s: String) -> Bool {
    if s.count != 4 && s.count != 6 { return false }

    var result = true
    for i in s {
        if Int("\(i)") == nil { result = false; break }
    }

    return result
}
```

## Study
- ~~목요일 건너뛰고, 금요일~~
- String을 for문에 넣어서 돌렸는데, 그렇게 하지 말고, `Int(String)`로만 해도 숫자가 아니면, 어차피 nil이 나온다. ;;

---
***The end***