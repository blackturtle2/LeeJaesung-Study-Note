# 모의고사
- 2019.04.16
- 난이도: 중하
- 걸린 시간: 약 25분

## Problem
- [https://programmers.co.kr/learn/courses/30/lessons/42840](https://programmers.co.kr/learn/courses/30/lessons/42840)
- 학생 1,2,3들 중 주어진 문제 배열에서 가장 많이 정답을 맞춘 학생 순서대로 배열을 반환하기.

## Solution

```swift
import UIKit

func solution(_ answers: [Int]) -> [Int] {
    let student0 = [1, 2, 3, 4, 5]
    let student1 = [2, 1, 2, 3, 2, 4, 2, 5]
    let student2 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    var count = [0, 0, 0]
    var result = [Int]()
    var i = 0

    answers.forEach {
        if $0 == student0[i % (student0.count)] { count[0] += 1 }
        if $0 == student1[i % (student1.count)] { count[1] += 1 }
        if $0 == student2[i % (student2.count)] { count[2] += 1 }

        i += 1
    }

    i = 1
    count.forEach {
        if $0 == count.max()! { result.append(i) }
        i += 1
    }

    return result
}

print("RESULT 1: ", solution([1, 2, 3, 4, 5])) // [1]
print("RESULT 2: ", solution([1, 3, 2, 4, 2])) // [1,2,3]
```
- 배열이 아닌, dictionary를 잘 활용했으면 좋았을 것 같다.
- key-value 형태로 꾸려갔으면 좋았을텐데, 그러지 못했다.

## Study
```swift
func solution(_ answers: [Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
```
- 위 풀이는 프로그래머스의 다른 사람 풀이.
- answer를 먼저 dictionary로 선언한 것도 괜찮은 것 같고, for문에서 i와 v를 왔다갔다 하며, 반복했던 것도 좋아보인다.
- 무엇보다 dictionary를 활용해 key-value 형태로 로직을 풀어서 원하는 값을 return한 것도 좋아보인다.

> 다음에 다시 dictionary를 활용해서 풀어보기.

---
***The end***