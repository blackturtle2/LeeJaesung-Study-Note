# 패스트캠퍼스 강의 노트 6th ( 20170515 )

## (복습) 1주차 리뷰
 - 객체 지향형 프로그래밍이란?
 - 클래스와 객체의 차이점
 - Xcode 사용법
 - 명명법
 - 변수: 문법, 변수의 타입
 - 함수: 문법, if-else문

// 딱 한마디로 설명하려 하지 않고, 누군가에게 `객체 지향형 프로그래밍`의 **역사와 사용하는 이유, 차이점, 장점, 단점**들을 자연스럽게 이어서 설명할 수 있어야 한다.

## (복습) 함수 명명하기
 - 이름을 잘 지을 수 있도록, `애플 레퍼런스`를 많이 보자.
 - `is..`로 시작하는 함수 이름은 `Bool` 값을 리턴하는게 관용적이다.
 - `니(_ inch:Double)` 이면, `cmFromInch(3.2)`와 같은 방법으로 사용된다.
 - 문장을 만들듯이 이름을 지어보자.
 - 외부 이름은 함수를 사용할 때, 알아보기 쉽도록 / 내부 이름도 내부에서 사용될 때, 효율적으로 알아볼 수 있도록 짓도록 한다.
 - `chFromInch(3.2)`와 `cmFrom(inch:3.2)`를 비교해보자.


# Switch

## switch 문법

```swift
func sampleSwitch(someCaracter:Character){
	switch comeCharater {
	case "a":
		print("The first letter of the alphabet")
	case "z":
		print("The last letter of the alphabet")
	default:
		print("Some other character")
	}
}
```

## Interval Matching
 : interval matching 은 `범위 연산자(...)`를 통해 해당 범위에 해당하는 value를 매칭시킬 수 있습니다.
 
```swift
func grade(fromPoint point:Int) -> String{
    var gradeValue:String = "F"
    
    switch point {
    case 95...100:
        gradeValue = "A+"
    case 90..<95:
        gradeValue = "A"
    default:
        gradeValue = "F"
    }
    
    return gradeValue
}
```

## Tuple Matching
> "case (_, 0)" 과 같이 case 안에 튜플을 사용할 수 있다.

 : 튜플을 사용해서 여러개의 Value를 동시에 확인할 수 있으며, 와일드카드(_)를 이용하면, 사용 가능한 모든 값에 대한 매칭이 가능합니다.
 
```swift
func getPoint(somePoint:(Int,Int)){
	swtich somePoint{
	case (0, 0):
		print("\(somePoint) is at the origin")
	case (_, 0):
		print("\(somePoint) is at the x-axis")
	case (0, _):
		print("\(somePoint) is at the y-axis")
	case (-2...2, -2...2):
		print("\(somePoint) is inside the box")
	default:
		print("\(somePoint) is outside of the box")
	}
}
```

## Value Binding
 : case 내부에서 사용되는 임시 값으로 매칭시킬 수 있다.
 
```swift
fun getPoint(somePoint:(Int,Int)){
	switch somePoint {
	case (0,0):
		print("\(somePoint) is at the origin")
	case (let x, 0):
		print("on the x-axis with an x calut of \(x)")
	case (0, let y):
		print("on the y-axis with an y value of \(y)")
	case (-2...2, -2...2):
		print("\(somePoint) is inside the box")
	default:
		print("\(somePoint) is outside of the box")
	}
}
```

## where
> case let (x, y) where x == y:

```swift
func wherePoint(point:(Int,Int)){
	switch point{
	case let (x, y) where x == y:
		print("(\(x), \(y)) is on the line x == y")
	case let (x, y) where x == -y:
		print("(\(x), \(y)) is on the line x == -y")
	case let (x, y):
		print("(\(x), \(y)) is just some arbitrary point")
	}
}
```
 - `(_, 0)`과 `(_, let y) where y == 0`은 같은 조건이다.

# 계산기 예제 소스 ( 기억하기 메모용 )

## 디스플레이에 "0"이 있으면, 숫자를 업데이트
 - `displayNumber` 변수를 만들어, 사용자에게 보이는 숫자가 아닌 내부 변수를 만들어 로직 내의 숫자를 저장한다.

```
switch displayNumber {
case "0":
    displayNumber = num
default:
    displayNumber += num
}
```

## 연산 전후의 첫번째 숫자와 두번째 숫자
 - 연산자를 누르기 전의 첫번째 수와 누른 후의 두번째 수를 구분하기
 - `tempOperation` 변수를 만들고, 연산 버튼을 누를 때마다 값을 채우고, 이 변수의 `isEmpty` 여부를 판단해 숫자를 저장한다.

```
if tempOperation.isEmpty {
    // 첫번째 숫자
    tempFirstNum = Int(displayNumber)!
    
    
    //"!"는 이 변수가 절대 nil이 될 수 없어! 라는 의미입니다. 개발자의 보증수표랄까..
    //displayLabel.text는 절대 nil이 될 수 없고, String 값이 Int가 될 때도 String에 문자만 있을리 없어라고 이야기하는 의미입니다.
}else{
    // 두번째 숫자
    tempSecondNum = Int(displayNumber)!
}
```

## 숫자 버튼 터치 함수
 - `self.displayLabel.text = displayNumber`
 - `displayNumber`의 값을 출력한다.

```
    @IBAction func clickButton0(_ sender: UIButton) {
        print("0번 버튼이 클릭되었습니다.")
        
        addDisplayNumber(num: "0")
        addFirstNumOrSecondNum(number: displayNumber)
        
        self.displayLabel.text = displayNumber
    }
```


---
### 문서 끝 ( by 재성 )