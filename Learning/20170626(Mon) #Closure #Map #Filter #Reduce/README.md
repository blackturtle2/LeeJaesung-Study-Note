# 패스트캠퍼스 강의 노트 33th ( 20170626 )

# 오늘의 Tip
 - 설정 앱 프로젝트에서 테이블 뷰의 디테일 뷰에서 스위치를 전환한 후, 이전 뷰로 넘어 왔을 때, `켬/끔` 상태를 `Notification`을 이용해서 상태 전환을 알려주도록 한다. //노티 연습에 큰 도움이 될 것.


# Closure

## 맛보기 예제

```swift
// MARK: ***** Int형 변수를 받아서 String형 변수로 구하기 *****
let changeStr = {(input: Int) -> String in return String(input)}
print(changeStr(5))


// MARK: ***** Int형 배열 받아서 String형 배열 구하기 *****
let changeArray = {(input: [Int]) -> [String] in
    var result:[String] = []
    for i in input {
        result.append(String(i))
    }
    
    return result
}
print(changeArray([5, 4, 3]))
    
    
// MARK: ***** 짝수 배열 구하기 *****
let printEvenNumber = {(input: [Int]) -> [Int] in
    var result:[Int] = []
    for i in input {
        if i % 2 == 0 {
            result.append(i)
        }
    }
    
    return result
}
print(printEvenNumber([2, 4, 5, 7, 1]))
```

# map
 - map은 지도가 아닌 mapping이란 단어로 이해.
 - 컬렉션의 각 항목의 데이터를 다른 데이터로 변경해주는 역할.
 - 클로저를 이용, 각 항목에 대해 한번 호출되며, 해당 항목에 대해 mapping된 값을 반환한다. (다른 타입도 가능)

```swift
public func map<T>(_ transform: (Element) -> T) -> [T]
```
```swiftlet digitNames = [1,2,3,4,5]let starList = digitNames.map { (number) -> String in    var star = ""    for _ in 0..<number		{			star += "*"		}	return star
	}print(startList)
```

# Filter
 - 컬렉션의 특정 아이템을 걸러내는 함수.
 - 클로져를 통해 걸러내어야 하는 데이터의 조건을 전달해준다.

```swift
filter(_ isIncluded: (Element) -> Bool) -> [Element]
```
```swiftlet digitNames = [1,2,3,4,5]let evenNumbers = digitNames.filter { (number) -> Bool in	return number % 2 == 0}
	
// 클로저 간소화
// let evenNumbers = digitNames.filter {$0%2 == 0}print(evenNumbers)
```

# Reduce
 - 컬렉션 내부의 모든 콘텐츠의 값을 하나의 값으로 합쳐주는 함수
 - 인자를 2개받으면 첫번째 인자는 초기값, 두번째 인자는 클로져로서 결과값과 각 인자를 합치는 역할을 합니다.

```swift
reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Bound) -> Result) -> Result
```
```swiftlet digitNames = 1...10let allSum = digitNames.reduce(0) { (num1, num2) -> Int in num1 + num2 }print(allSum)
// 0(초기값) + 1 + 2 + 3 + 4 ... + 10
// 결국은 1부터 10까지 더하는 함수.

let allSum2 = digitNames.reduce(10) { (num1, num2) -> Int in num1 + num2 }
// 10 + 1 + 2 + 3 + 4 ... + 10
```

## Jaesung's Example

```swift
// MARK: ***** map *****
let arrayA = [2, 3, 12, 4, 6, 2, 3, 6, 7]
let strArrayA = arrayA.map { (input) -> String in return String(input) }
print(strArrayA)


// MARK: ***** filter *****
let oddNumberArrayA = arrayA.filter { (number) -> Bool in
    return number % 2 != 0
}
print(oddNumberArrayA)


// MARK: ***** 구구단 구하기 *****
// 구구단 구하는 클로저: (Int) -> [Int]
let multiplication = { (input: Int) -> [Int] in
    var result:[Int] = []
    for i in 1...9 {
        result.append(input * i)
    }
    return result
}
print(multiplication(5))


// MARK: ***** 팩토리얼 구하기 *****
let factorial = { (input: Int) -> Int in
    var result:Int = 0
    let arrayInput = 1...input
    result = arrayInput.reduce(1, { (num1, num2) -> Int in
        num1 * num2
    })
    
    return result
}
print(factorial(5))
```

---
### 문서 끝 ( by 재성 )