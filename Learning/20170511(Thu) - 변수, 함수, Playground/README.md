# 패스트캠퍼스 수업 노트 4th

## 오늘의 팁 ( Powered by 조교님 )
1. `파인더(Finder)` 단축키 팁
	1.  보기 방법 바꾸기: <kbd>command</kbd> + <kbd>1</kbd> //숫자키를 번갈아가면서 눌러보세요.
	2.  파일 실행하기: <kbd>command</kbd> + <kbd>↓</kbd>
	3.  상위 폴더로 이동하기: <kbd>command</kbd> + <kbd>↑</kbd>
	4.  앱의 환경설정 접근하기: <kbd>command</kbd> + <kbd>,</kbd>
2. `Alfred` 사용해보기 - [https://www.alfredapp.com/](https://www.alfredapp.com/)

## Xcode 단축키
1. <kbd>command</kbd> + <kbd>0</kbd>
	 - 왼쪽(Navigator) 열고 닫기.
2. <kbd>command</kbd> + <kbd>option</kbd> + <kbd>0</kbd>
	 - 오른쪽(Utilities) 열고 닫기.
3. <kbd>command</kbd> + <kbd>option</kbd> + <kbd>1</kbd>
	 - 상단 탭 메뉴 이동. //숫자를 번갈아가면서 눌러보세요.
4. <kbd>command</kbd> + <kbd>1</kbd>
	 - 내비게이터로 커서 이동.
5. <kbd>command</kbd> + <kbd>J</kbd>
	 - 선택을 키보드 방향키로 이동할 수 있음. //눌러보면 알아요.


## ( 복습 ) 객체지향형 프로그래밍의 특징
: 추상화 / 캡슐화 / 은닉화 / 상속성 / 다형성

---

# 변수와 함수
> 변수: 프로그램에서 데이터의 저장 공간을 담당 #MEMORY
> 
> 함수: 프로그램이 실행되는 행동을 담당 #CPU

## 변수를 만드는 것에 있어 필요한 것은?
> Keyword, Name, Type
 
1.  문법: `키워드(Keyword) 변수명(Name):타입(Type)`
2.  `var`는 **Variables** 의 약자
3.  Type은 ~거의~ 대문자로 약속되어 있다. ( 사용자가 정의한 Type은 소문자로 시작할 수는 있지만, 권장하지 않음 )
4.  `변수`와 `함수명`은 **lowerCamelCase**, `클래스명`은 **UppercamelCase**로 작성한다.
5.  Swift에서 변수와 상수는 선언시에 무조건 값을 넣도록(초기화) 되어 있다. ( 단, 옵셔널을 통해 넣지 않을 수는 있다. 다음 기회에.. )

```swift
//변수 선언 예시
 var vName:Any
```

## 함수를 만들기 위해 필요한 것은?
> Keyword, Name, Value, Action, Return Type
 
1.  키워드(Keyword) + 함수명(Name) + 입력 값(Value) + 함수 내용(Action) + 결과 타입(Return Type)

```swift
// 함수 선언 예시
func vName(_ parameter: Any) -> Any
{
 // (함수 내용)
}
```

## 다양한 형태의 변수와 상수
```swift
// 일반 변수 선언
var name:String = “joo”

// 변수의 값 재정의
var number:Int = 50
number = 100

// 상수 선언
let PI = 3.14

// 옵셔널 변수 선언
var address:String?
address = “서울시 신사동"
```


## 변수 타입
 > Int, Double, String, Bool

1.  정수: `Int` ( ex. 123 )
    1.  Int : +/- 부호를 포함한 정수.
    2.  Uint : - 부호를 포함하지 않은 정수. ( 0은 포함 )
2.  불리언: `Bool` ( ex. true )
	 1. true or false
3.  실수: `Double` ( ex. 0.123 )
    1.  64비트 부동소수점은 Double / 32비트 부동소수점은 Float
    2.  우리는 편의상 Double을 사용한다.
4.  문자: `Char` ( ex. “A” )
    1.  쌍따옴표(" ") 를 꼭 사용한다.
    2.  문자 1개 표현.
5.  문자열: `String` ( ex. “string” )
    1.  쌍따옴표(" ") 를 꼭 사용한다.
    2.  문자 여러개 표현.


## String 조합
1. String 변수 안에 변수 값을 첨부할 때는 Interpolation(삽입; \\)을 사용한다.
2. 참고: [이스케이프 시퀀스](http://ko.cppreference.com/w/cpp/language/escape)
3. `\n`: 라인피드 / `r`: 

```swift
var name:String = “이재성”
print(“my name is \(name)”)
```

## 튜플
> var person:(name:String, age:Int) = ("Lee", 30)

1.  정해지지 않은 데이터 타입의 묶음을 말한다.
2.  각 타입마다 이름을 지정해 줄 수도 있다. //`name:String`

```swift
var coin:(Int, Int, Int, Int) = (3,1,5,3)
print("1st : \(coin.0)")print("2nd : \(coin.1)”)
print("3rd : \(coin.2)")print("4th : \(coin.3)”)

var person:(name:String, age:Int, weight:Double) = ("Lee", 30, 75)
print("name : \(person.0)”)
print("age : \(person.1)”)
print("weight : \(person.2)”)
```

## 캐스팅 (형변환)
> stringNum = String(intNum) //Int형인 intNum을 String형으로 변환한다.

```swift
var total:Int = 107
var average:Double
average = total/5 //타입 에러

average = Double(total)/5 //캐스팅
```

```swift
var stringNum:String
var doubleNum:Double
let intNum:Int = 3

stringNum = String(intNum) //int를 string으로 캐스팅
doubleNum = Double(intNum) //int를 double로 캐스팅
```

## 변수 예제 ( Powered by 재성 )
// 예제 하나에 튜플 선언과 캐스팅을 모두 담았습니다. ~(윙크)~

```
var tripFriend:(name:String, age:Int, location:String) = ("leejaesung", 30 , "Seoul")

print("저는 \(tripFriend.name) 와 여행을 갈 계획입니다.")
print("\(tripFriend.name) 의 나이는 \(String(tripFriend.age)) 이고, \(tripFriend.location)에서 출발할 예정입니다.")
```

--
// 함수

## 함수의 문법과 인수명

```swift
func fName(agumentName paramName:Int) -> Int
{
	return paramName + 3
}
fName(agumentName: 10)
```

1. 문법: `키워드 함수명(인수명 매개변수명:타입) -> 반환타입 { (함수 내용) }`
2. 인수명(인수레이블)은 Objective-C에서 파생되면서 Swfit 3.0 으로 넘어온 .. ~일종의 유물~
3. 형태: 함수명(외부이름 매개변수:타입, 외부이름 매개변수:타입 ... )
4. 함수명과 인수명의 조합의 예시: `func add(num1 numInt:Int, ...)` //함수명과 인수명이 합해져서 하나의 함수명이 완성된다. `addnum1` //읽기 깔끔(?)해졌다.
5. 인수명을 명명하지 않으려면, 와일드카드(`_`)라는 것을 사용하면 된다. 인수명이 없는 것은 아니고, 와일드카드가 된 것이다.

## Default Parameter Values
> 매개변수 자리에 초기 값을 바로 넣을 수 있다.

```swift
func number(num1:Int, num2:Int = 10) -> Int
{
	return num1 + num2
}
number(num1: 10) //결과: 20
number(num1: 10, num2: 5) //결과: 15
```

## In-Out Parameter Keyword
> 함수의 매개변수는 상수값을 가지므로 혹시 이를 변경하고 싶다면, inout을 사용해야만 한다.

1. 함수에서 매개변수는 기본적으로 상수값을 가진다.
2. 만약에.. 함수 내에서 매개변수의 값을 변경해야 한다면(!!) 타입명 앞에 `inout`키워드를 붙인다.
3. inout 변수가 지정된 함수의 인수 앞에서 &가 붙어야만 한다.

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) -> Int
{
    let tempA = a
    a = b
    b = tempA
    
    return b
}
var someInt = 3
var anotherInt = 107
var totalInt = swapTwoInts(&someInt, &anotherInt)
// = 3
//inout 키워드가 먹은 매개변수여서 변수명 앞에 &를 붙였다.

print("\(someInt) , \(anotherInt)")
// = 107 , 3
//&로 인해 주소값을 참조해서 someInt와 anotherInt의 값이 바뀌었다.
```

## 반환 타입
1. 함수 실행 결과의 타입을 명시한다.
2. 꼭 반환 타입과 같은 타입의 데이터를 반환해야 한다.
3. return 뒤의 명령어는 실행되지 않는다.
4. 반환 타입이 없어도 되고 쓰지 않으려면, 화살표(->)부터 제거한다.


---
### 문서 끝