# 패스트캠퍼스 강의 노트 8th ( 20170517 )

## 모닝 연습문제 ( Powered by 조교님 )
 - `TextField`, `Label`, `Button`이 있는 싱글 뷰 앱을 만든다.
 - TextField에 입력한 2보다 큰 양의 정수에 대해 자기 자신과 1을 제외한 약수의 합이 Label에 출력되는 앱을 완성한다.

```swift
@IBAction func runButtonTouched(_ sender: UIButton) {
        let numb: Int = Int(self.inputTextField.text!)!
        //self.isEven(number: numb)
        self.makeDivisor(number: numb)
    }
    

func makeDivisor(number num:Int) {
    var result: Int = 0
    
    if num <= 2 {
        self.resultLabel.text = "잘못 입력했엉!"
    } else {
        for i in 2..<num {
            if num % i == 0 {
                result += i
            }
        }
    }
    
    self.resultLabel.text = "결과는 \(String(result)) 이양!"
}
```

# Optional

## nil
> 선언만 되고 인스턴스를 생성하지 않은 상태를 "nil"이라고 한다.

 - Swift는 `Type Safety` 원칙(**안정성!!!**)을 통해 nil 값을 허용하지 않고, 함수를 실행시에 error를 발생시킨다.
 - 따라서 `var name`과 같은 초기화조차 되지 않은 코드는 컴파일러가 허용하지 않는다.
 - 하지만, 작업을 하다보면, nil이 필요할 때가 있다. 그래서 나온게.. `Optional`

## Optional ( 옵셔널 )

 - 모든 타입은 Optional이냐 아니냐로 나뉘어진다.
	 - optional은 2가지 가능성을 가질 수 있다.
	 - 하나는 **값이 있음**을 나타내고 -> `!` 기호 사용.
	 - 다른 하나는 **nil의 가능성**을 내포하고 있다 -> `?` 기호 사용.
 - `list.append(Int(strNum))`에서 `Int(strNum)`이 nil일 수 있으므로 nil이 아니라고 알려주기 위해 뒤에 느낌표(!)를 붙인다.
 - 캐스팅을 할 때는 항상 optional 타입으로 나온다. 캐스팅이 된다고 장담할 수 없다.

> 사용처는… UIKit, Foundation 애들이 옵셔널인 경우가 많아서
> 알아서 쓰게 됩…
> 리턴값이 있거나 nil 인 경우에 대부분 쓰여서
> 생각보다 많이 쓰여요
> 
>  \- feat. 존경하는 멋진 iOS 개발자 분

```
// 예를 들어..
let availableVehicle: Vehicle? = API.availableVehicles(at: location)...

guard let vehicle = availableVehicle else {
  return print('no vehicle');
}
print(vehicle.name);
```

## Forced Unwrapping ( 강제 해제 )
```swift
func testFunc(optionalStr:String?){    if optionalStr != nil	{           let unwrapStr:String = optionalStr!           print(unwrapStr)	}
}
```
 - 옵셔널 변수에 값이 있는지 확인하여 보통의(?) 변수로 전환시킨다.
 - 옵셔널 변수도 일종의 `타입(Type)`이다.

## Optional Binding ( 선택적 해제 )```swiftfunc testFunc(optionalStr:String?){    if let unwrapStr:String = optionalStr    {       print(unwrapStr)    }}
```
 - 대부분의 함수들은 인수로 옵셔널을 받지 않는다. 그래서 옵셔널을 해제시키고, `String`과 같은 변수에 넣어버린다.

```
func isNumber(inputNum1:String, inputNum2:String) -> Bool{	if let firstNumber = Int(inputNum1), let secondNumber = Int(inputNum2)	{		return true	}else {
		return false
	}
}
```
 - 콤마( , )를 통해 옵셔널 바인딩을 추가하고, 또 조건도 추가 할수 있다.

## Early Exit _ feat. Guard 문
```
func testFunc(optionalStr:String?){    guard let unwrapStr:String = optionalStr  else
		//문법: guard (조건값) else {실행}
		//조건값이 false 일때, 실행!!	{		return	}	print(unwrapStr)}
```
 - 앞에서 옵셔널 바인딩이 ~넘나 귀찮은 관계로~ if문을 자주 사용한다는 것으로 판단하여 `guard`문이 나타나게 되었다.
 - `guard`문은 **조건값이 거짓일 때, 실행**된다.

## 예제
 - friendList(배열) 옵셔널 변수 만들기
 - func addFriend(name: String) 만들기
 - printFriendList() 함수 만들기

```
var friendList: [String]?
    
func addFriend(name: String) {
    
    if friendList == nil {
        friendList = Array<String>()
    }
    
    friendList!.append(name)
    
}

func printFriend() {
    
    if let friends:[String] = friendList { //옵셔널 바인딩
        
        for friendName in friends {
            print(friendName)
        }
    }
}
```

## 연습 문제
 - `friendList` : Dictionary를 가진 배열을 선언한다.
 - 이름(name)과 성(gender)을 넣고, 그 값들을 추가하며, 프린트한다.
 - `for-in`을 이용해 배열과 딕셔너리로 원하는 키의 데이터를 출력할 수 있다.
 - 배열이 딕셔너리를 element(요소)로 가질 수 있고, 혼동하지 말 것.

```swift
//var friendList:Array<Dictionary<String,String>>? //아래 선언과 같은 뜻의 표현.
//var friendList:Array<[String:String]>? //아래 선언과 같은 뜻의 표현.
var friendList:[[String:String]]?
    
func addFriend(name: String, gender:String) {
    var friend:[String:String] = [String:String]()
    
    friend.updateValue(name, forKey: "name")
    friend.updateValue(gender, forKey: "gender")
    
    addFriend(friendData: friend)
}
    
func addFriend(friendData:[String:String]) {
    if friendList == nil {
        friendList = []
    }
    
    friendList!.append(friendData)
}
    
func friendNames() -> [String] {
    
    guard let friends = friendList else{
        return []
    }
    
    var returnList:[String] = []
    
    for friend:[String:String] in friends {
		//friends의 element 개수만큼 반복하고, friends의 element는 Dictionary이다.
        let name:String = friend["name"]!
        returnList.append(name)
    }
    
    return returnList
    
}
    
func printFriendName() {
    if let friends = friendList { // 옵셔널 바인딩
        
        for friend in friends {
            
            for (key,value) in friend { //이중 for문은 좋지 않은 것..
                if key == "Kim" {
                    print(value)
                }
            }
            
            // let name = friend["name"]
            // print(name)
            
        }
    }
    
}
```

# Class ( 클래스 )

## 프로퍼티

 - 하나의 클래스에서 클래스 전체에 영향을 주는 변수를 `프로퍼티(Property)`라고 하고, 함수는 `메소드(Method)`라고 부른다.
 - **객체**는 `속성`을 가지고 있고, **클래스**는 `객체의 속성와 행위`를 정의한다.

## 객체 만들기
`var myHat:Hat = Hat()`
`var yourHat:Hat?`

 - `Hat()` : `인스턴스`를 만드는 것. `feat. #초기_함수`
 - `myHat` : `변수`라고 부른다. 인스턴스를 담고 있는 무언가.
 - `yourHat` : `nil` 을 갖고 있는 `변수`
 - 객체에 있는 함수라거나 객체에 있는 속성을 사용하려면 `.`을 사용한다.
	 - `myHat.color = "블랙"`

## init ( 초기화 )

```class Hat {	var color:String = "흰색"
	var shape:String = ""
	var size:Int = 0	init(color:String, size:Int) {
		self.color = color
		self.size = size   }}
```
 - `init()`으로 초기화가 가능하고, 위와 같이 커스텀 초기화가 가능하다.
 - 커스텀 초기화로 프로퍼티 값이 들어갈 경우, 프로퍼티는 옵셔널이 아니다. init() 함수는 반드시 실행되고, 그때 값이 저장되기 때문이다.

## self
 - 자기 자신 인스턴스를 가리키는 포인트.
 - 명시적 표시 or 중복 구분을 위해 사용.
 - 프로퍼티만 self가 될 수 있다.
 - self를 사용하면, 다시 자기 자신의 위치로 가서 프로퍼티를 참조한다.

## 클래스 - 연습 문제
 - 학점 계산기 만들기
 - 학생(Student), 과목(Subject), 학점관리자(ScoreManager) 클래스를 각각 만들어 서로 연동되도록 한다.
 - 클래스는 Type으로 활용됩니다.

### Subject 클래스
 - `Subject` 클래스에는 `name`과 `score`라는 2개의 프로퍼티를 가지고 있다.

```swift
class Subject {
    
    let name:String
    var score:Int
    
    init(name:String, score:Int) {
        self.name = name
        self.score = score
    }
}
```

### Student 클래스
 - `var subjects:[Subject]?` : Subject 타입의 subjects 변수를 만든다.
 - `if subjects == nil` : 옵셔널로 선언한 subjects 변수를 위해 옵셔널 바인딩을 거친다.

```swift
class Student {
    let name:String
    var average:Double?
    var subjects:[Subject]?
    
    init(name:String) {
        self.name = name
    }
    
    // 학생의 과목과 점수를 추가하는 함수
    func add(subjectName name:String, score:Int) {
        if subjects == nil { //옵셔널 바인딩
            subjects = []
        }
        
        let sb:Subject = Subject(name: name, score: score)
        subjects!.append(sb)
    }
    
}
```

### ScoreManager 클래스
 - 점수의 평균과 합계를 계산하는 함수를 가진 클래스. //합계는 powered by 재성

```swift
class ScoreManager {
    
    func average(forStudent student:Student) -> Double {
        
        var returnAverage:Double = 0.0
        
        if let subjects = student.subjects {
            var total:Int = 0
            
            for subject in subjects {
                total += subject.score
            }
            
            returnAverage = Double(total / subjects.count)
        }
        
        return returnAverage
    }
    
    func makeTotal(forstudent student:Student) -> Double {
        var resultTotal:Double = 0
        
        if let subjects = student.subjects {
            for subject in subjects {
                resultTotal += Double(subject.score)
            }
        }
        
        return resultTotal
    }
}
```

### ViewDidLoad
 - 클래스를 타입처럼 활용한다!

```swift
//ViewDidLoad
let s1:Student = Student(name: "Lee")
    s1.add(subjectName: "수학", score: 95)
    s1.add(subjectName: "물리", score: 80)
    s1.add(subjectName: "영어", score: 85)
    s1.add(subjectName: "화학", score: 80)
    s1.add(subjectName: "생물", score: 85)
    
    let s2:Student = Student(name: "Kim")
    s2.add(subjectName: "수학", score: 75)
    s2.add(subjectName: "물리", score: 85)
    s2.add(subjectName: "영어", score: 82)
    s2.add(subjectName: "화학", score: 96)
    s2.add(subjectName: "생물", score: 95)
    
    let manager:ScoreManager = ScoreManager()
    let s1_Average = manager.average(forStudent: s1)
    let s2_Average = manager.average(forStudent: s2)
    let s1_Total = manager.makeTotal(forstudent: s1)
    let s2_Total = manager.makeTotal(forstudent: s2)
    
    print("합계 계산")
    print(s1_Total)
    print(s2_Total)
    
    print("평균 계산")
    print(s1_Average)
    print(s2_Average)
```
---
### 문서 끝 ( by 재성 )