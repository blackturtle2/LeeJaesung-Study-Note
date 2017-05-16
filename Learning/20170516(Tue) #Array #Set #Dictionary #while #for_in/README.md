# 패스트캠퍼스 강의 노트 7th ( 20170516 )

## swift & xcode Tips
 - 함수 위에 `///` 주석으로 설명을 달고, <kbd>option</kbd> 누르고 함수를 클릭하면, 말풍선으로 된 설명을 볼 수 있다.
 - `// MARK: - 숫자 버튼들`와 같은 주석으로 코드의 흐름을 구분할 수 있다. ( Xcode의 경로표시줄에서 쉽게 이동이 가능하다. )
 - `UIButton`의 `sender`에서 `sender.titleLabel.text`을 통해 버튼의 텍스트 값을 받아올 수 있다.
 - ```
	@IBAction func numberButtonTouched(_ sender: UIButton) {
	        print("\(sender.currentTitle!)) 번 버튼이 클릭되었습니다.")
	        
	        addDisplayNumber(num: (sender.titleLabel?.text)!)
	        addFirstNumOrSecondNum(number: displayNumber)
	        
	        self.displayLabel.text = displayNumber
	    }
	```

# Collection Type
> Array, Set, Dictionary

 - 변수(var)로 할당하면, Collection를 변경 가능하다. ( 추가, 제거, 수정 )
 - 상수(let)으로 할당하면, Collection은 당연히 변경 불가능하다.

## Array ( 배열 )
> 정렬된 값의 모음.
> 같은 종류의 데이터들이 순차적으로 저장되어 있다.

```
var SomeInts:[Int] = [Int]()
var SomeInts:Array<Int> = Array<Int>()
var SomeInts:[Int] = [1, 2, 3] //리터럴(literal) 문법

print("\(SomeInts[0])") // = 1
print("\(SomeInts[1])") // = 2
```

### 리터럴(literal) 문법
// 개인적인 리서치

1. `String`도 원래는 `var name:String = String()`으로 작성하고, 값을 넣어야 한다.
2. 하지만, 어차피 변수는 값이 필요하고, 편의상 `var name:String = "Lee"`처럼 사용한다.
3. 배열도 마찬가지로 `var SomeInts:[Int] = [Int]()`으로 작성하고, 값을 넣는다.
4. 하지만, 리터럴 문법을 통해 `var SomeInts:[Int] = [1, 2, 3]`와 같이 간단히 선언과 초기화를 할 수 있다.

### 배열의 추가 기능
 - element count / 추가 / 삽입 / 삭제
 - 빈 배열의 확인

### Quick Help
 : <kbd>command</kbd> + <kbd>shift</kbd> + <kbd>O</kbd>

## Set ( 집합 )
> Array가 아닌, Set은 집합 연산을 사용하고자 할 때, 유용하다.

```
var someInts:Set<Int> = Set<Int>()
```

 - `Set`은 같은 타입의 데이터가 순서 없이 모여 있는 자료구조이다.
 - Array와 문법이 비슷하므로 반드시 Type인 `Set`을 명시해주도록 한다.
 - Array와 다르게 축약 문법(리터럴 문법)이 없다.
 - Set의 집합 연산으로 `a.intersection(b)`:교집합, `a.symmetricDifference(b)`:교집합의 여집합의 합집합, `a.union(b)`:합집합, `a.subtracting(b)`:여집합 등이 있다.


## Dictionary ( 사전 )
> Dictionary는 추후 통신할 때, Json과 잘 맞아서 많이 사용된다.

```
var someInts:[String:Int] = [String:Int]()
var someInts:Dictionary<String,Int> = [:]

var airports: [String:String] = ["ICH":"인천공항", "CJU":"제주공항"]
print("\(airports["ICH"])")
```
 - `Dictionary`는 순서가 정해져 있지 않은 데이터에 키 값을 통해 구분할 수 있는 자료구조이다.
 - `[String:Int]`: Key 타입이 String이고, Value 타입이 Int인 Dictionary 이다.
 - `[String:[Int]]`: Key 타입이 String이고, Int 타입의 배열 타입로 Value 타입을 갖고 있는 Dictionary 이다.
 - `Key` 값은 Dictionary에서 `value`를 가져오는데 사용되는 값이다.

---
## 한마디로 정리
~내 마음대로..~
> `Array`는 Index 값으로 Value를 컨트롤하는 정렬된 데이터 타입이다.
> 
> // var AA:Array<Int> = [1, 2, 3]
> 
> `Set`은 Value가 순서와 상관 없이 저장된(정렬되지 않은) 데이터 타입이고, 집합 연산을 사용할 수 있다.
> 
> // var BB:Set<Int> = Set<Int>()
> 
> `Dictionary`는 Key 값으로 Value를 컨트롤하는 정렬되지 않은 데이터 타입이다.
> 
> // var CC:Dictionary<String, Int> = ["aa":1, "bb":2]

### 콜렉션 타입들의 선언 문법

```
var list:Array<Int>
var setv:Set<Int>
var dic:Dictionary<String, Int>
```

### 콜렉션 타입들의 선언 문법 2

```
var SomeInts:Array<Int> = Array<Int>()
var SomeInts:[Int] = [1, 2, 3]

var someInts:Set<Int> = Set<Int>()

var someInts:Dictionary<String,Int> = [:]
var someInts:[String:Int] = [String:Int]()
```

# 반복문

## While문
```
var index = 0;

while index < 10
{
	print("현재 횟수는 \(index)입니다.")
	index += 1;
}
```

## for-in문
```
let numbers = [1,2,3,4,5]

for number in numbers
{
	print("\(number)")
}
```
 - Swift에는 ~그냥~ `for`문은 없다. 무조건 `for-in`문
 - 배열의 항목, 숫자의 범위 또는 문자열의 문자와 같은 시퀀스를 반복할 때, 사용한다.
 - `for` 바로 다음에 오는 변수는 따로 선언할 필요가 없다.

```
let base = 3
let power = 10
var answer = 1

for _ in 1...power { //범위 연산자
	answer *= base
}
```
 - 문법상 필요하지만, 실제 동작에서 사용하지 않는 변수 이름에 **와일드 카드 (_)**를 사용한다.
 - 배열을 항상 만들 필요 없이, 범위 연산자를 이용하면 빠른 `for-in` 반복문을 사용할 수 있다.
 - **범위 연산자를 이용한** `for-in`문이 나온 뒤에 Swift에서 `for`문이 사라졌다.
 - 범위 연산자의 리턴값은 사실.. 배열이 나온다. ~두둥~ `1...3 -> [1, 2, 3]`


## 예제
```
func googoodan(number num:Int) {
    var firstNum:Int = 1
    
    while firstNum <= 9 {
        print("\(num) * \(firstNum) = \(num*firstNum)")
        firstNum += 1
    }
}
    
func ggdVerFor(dan:Int) {
    var firstNum:Int = 1
    
    for _ in 1...9 {
        print("\(dan) * \(firstNum) = \(dan*firstNum)")
        firstNum += 1
    }
}
    
func fatorialOf(number num:Int) -> Int {
    var vNum:Int = 1
    
    for i in 1...num {
        vNum *= i
    }
    
    return vNum
}
```

## 연습 문제
```
// MARK: 로또 번호 뽑기 프로토타입 ( max 45, 숫자 6개 뽑기 )
func findLottoProtoType() -> [Int] {
    var lottoNumbers:[Int] = []
    
    for _ in 1...6{
        let randomNum:UInt32 = arc4random_uniform(45)
        lottoNumbers.append(Int(randomNum))
    }
    
    return lottoNumbers
}

// MARK: 로또 번호 뽑기 (중복 제거)
func findLotto() -> [Int] {
    var lottoNumbers:[Int] = []
    
    while lottoNumbers.count < 6 {
        let randomNum:UInt32 = arc4random_uniform(45)
        
        if randomNum != 0 && !lottoNumbers.contains(Int(randomNum)) { // 로또 번호에 0이 들어가면 안된다.
            lottoNumbers.append(Int(randomNum))
        }
    }
    
    return lottoNumbers
}

// MARK: 약수 구하기
func makeDivisor(number num:Int) -> [Int] {
    var result:[Int] = []
    
    for i in 1...num {
        if num % i == 0 {
            result.append(i)
        }
    }
    
    return result
}

// MARK: 소수 판별기
func isPrimeNumberOf(number num:Int) -> Bool {
    var result:Bool = false

    if makeDivisor(number: num).count <= 2 {
        result = true
    }
    
    return result
}
```

---
### 문서 끝 ( by 재성 )