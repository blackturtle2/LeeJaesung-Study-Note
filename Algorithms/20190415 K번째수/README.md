# K번째수
- 2019.04.15
- 난이도: 하
- 걸린 시간: 약 25분
- 문제 링크: [https://programmers.co.kr/learn/courses/30/lessons/42748?language=swift](https://programmers.co.kr/learn/courses/30/lessons/42748?language=swift)

## Problem
- 두번째 입력 배열(`commands`)을 [i, j, k]라고 하면, 첫번째 배열(`array`)의 i부터 j번째까지 자르고, k번째의 값을 출력한다.
- 두번째 입력 배열이 여러개일 수 있고, 따라서 출력 값은 배열로 리턴한다.

## Solution

```swift
func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    return commands.map { array[($0[0]-1)...($0[1]-1)].sorted()[$0[2]-1] }
}

print("RESULT: ", solution([1,5,2,6,3,7,4], [[2,5,3], [4,4,1], [1,7,3]])) // [5, 6, 3]
```

## Study
- 처음에는 아래와 같이 `result` 변수를 위에 두고, `append` 하는 식으로 구현했으나, `forEach`를 `map`으로 바꿔서 한번에 리턴하여 라인 수를 줄일 수 있었다.

```swift
func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    var result = [Int]()

    commands.forEach {
        let sliceArray = array[($0[0]-1)...($0[1]-1)].sorted()
        result.append(sliceArray[$0[2]-1])
    }

    return result
}
```

### sort() & sorted()
- 배열을 정렬할 때, `sort()`와 `sorted()`가 있다.
- `sort()`는 호출된 배열을 변경하고, `sorted()`는 호출된 배열의 복사본을 반환한다.

### ArraySlice
- A 배열이 있을 때, 인덱스 i부터 j까지 자르고 싶으면, `A[i...j]`를 사용하면 된다.
- ex. `A = [0,1,2,3,4,5]` / `A[0...3] = [0,1,2,3]` / `A[0..<3] = [0,1,2]`

---
***The end***