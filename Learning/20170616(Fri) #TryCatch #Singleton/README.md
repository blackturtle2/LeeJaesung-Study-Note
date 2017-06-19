# 패스트캠퍼스 강의 노트 28th ( 20170616 )

# 오늘의 팁

## `PairProgramming` Code Review Day

 - 버튼을 눌러서 segue를 태우는 로직에서 예외처리를 할 때, `performSegue(withIdentifier identifier: String, sender: Any?)`을 이용해서 처리를 하도록 하자.
 - 함수의 input과 output을 잘 설계해서, output의 타입을 꼭 필요한 타입으로 return하도록 하자. ( UInt32 등등 )


# 예외처리

## Error - 에러는 Error 프로토콜을 준수하는 유형의 값으로 나타냅니다. 실제로 Error 프로토콜은 비어 있으나 오류를 처리할수 있는 타입임을 나타냅니다.

```swift
enum VendingMachineError: Error {    case invalidSelection    case insufficientFunds(coinsNeeded: Int)    case outOfStock}
```

## 에러 전달

```swift
//에러전달 가능성 함수func canThrowErrors() throws -> String//에러전달 가능성이 없는 함수func cannotThrowErrors() -> String
```


## 에러 처리
 - 함수가 에러를 throw하면 프로그램의 흐름이 변경되므로 에러 가 발생할 수있는 코드의 위치를 신속하게 식별 할 수 있어야합 니다.

예제 참고: [애플 공식 문서](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html)


## Converting Errors to Optional Value - 에러가 없을 수도 있어서 옵셔널(?) 처리 한다.
```swift
func someThrowingFunction() throws -> Int {// ...}
let x = try? someThrowingFunction()let y: Int?
do {    y = try someThrowingFunction()} catch {	 y = nil
}
```

## Specifying Cleanup Actions (후처리)
 - `defer`
 - 함수가 종료되더라도 defer는 꼭 실행되고, 아래의 defer부처 실행된다.

```swift func processFile(filename: String) throws {     if exists(filename) {         let file = open(filename)         defer {             close(file)         }         while let line = try file.readline() {             // Work with the file.		  }         // close(file) is called here, at the end of the scope.	}
}
```

---

# Singleton

## `Singleton`이란?
 - 어플리케이션 전 영역의 걸쳐 하나의 클래스의 단 하나의 인스턴스만(객체)을 생성하는 것을 싱글톤 패턴이라고 한다.
 - 사용 이유: 애플리케이션 내부에서 유일하게 하나만 필요한 객체에서 사용.
 - 클래스 메소드로 객체를 만들며 `static`을 이용해서 **단 1개의 인스턴스** 만 만든다.
 - **앱 내에서 공유하는 객체** 를 만들 수 있다.
 - 물론, 앱이 종료되면 사라진다.
 - `Singleton Pattern`은 일종의 디자인 패턴으로 JAVA, Obj-C 등 객체지향 언어에서도 다루고 있다.

### 싱글톤 문법

```swift
class SingletonClass {    // MARK: Shared Instance    static var sharedInstance:SingletonClass = SingletonClass()
        // Can't init is singleton    private init() {	//초기화가 필요하면 private로 생성 }}
```

### Function & Method
 - `함수`는 인스턴스를 만들지 않아도 사용할 수 있다. ( ex. `print()` )
 - `메소드`는 인스턴스를 만들어야지만, 사용할 수 있는 것을 메소드라고 한다.

```swift
import Foundation

func function2DA() {
	// 파일 안에 있을 뿐, 별도 클래스 안에 있지 않은 것이 함수.
	// Objective-C에서는 불가능했다. Swift는 함수형 프로그래밍이 가능하기 때문에 허용!
}

class SampleClass {
	static func typeMethod() {
		//클래스 안에서 만든 것이 메소드
	}
}
```
```swift
class main {

	function2DA()
	//...//
	
	SampleClass.typeMethod()
	//...//
	
}
```

## Singleton Pattern 예제

```swift
//스크린 정보를 가지고 있는 객체let screen = UIScreen.main //사용자 정보를 저장하는 객체let data = UserDefaults.standard //어플리케이션 객체let app = UIApplication.shared
//파일 시스템 정보를 가지고 있는 객체let fileManager = FileManager.default
```

### [예제] 재성이 만든 예제
 - 뷰를 이동할 때, 싱글턴 데이터를 가지고 이동하기.

```swift
class DataCenter {
    static var sharedData:DataCenter = DataCenter()
    
    var textData:String = String()   
}
```

```swift
class SecondViewController: UIViewController {
    
    @IBOutlet var textfieldInput:UITextField?
    @IBOutlet var labelData:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        labelData?.text = DataCenter.sharedData.textData
        
    }
    
// ... //

    @IBAction func buttonAction(_ sender:UIButton) {
        
        DataCenter.sharedData.textData = DataCenter.sharedData.textData + (textfieldInput?.text ?? "test")
        
    }
```

## Singleton 내용 보완 ( 2017.06.19 )
 - `Singleton`은 프로젝트 전체에서 단 하나(유니크)의 이름으로 만들어진 인스턴스 딱 하나이다.
 - `Singleton`은 **디자인 패턴** 일 뿐이고, iOS에서 `Singleton`을 만들 때, `타입 프로퍼티`를 사용할 뿐이다.
 - `Static`은 딱 한번 사용할 것인데 램에 상주하게 되기 때문에, 자주 남발되면 매우 곤란하다.
 - `그.러.나` 꼭 필요한 경우, 만들어야 하고 그게 `Singleton`이 된다.
 - `Singleton` 인스턴스가 만들어질 때, `init()`을 하게 되고, 인스턴스가 사라질 때, `deinit()`이 불려지고, 이것은 앱이 죽을 때이다.

```swift
class FriendData {
	private static let instance:FriendData = FriendData()
	
	// 외부에서는 FriendData.standard를 통해 접근한다.
	class ver standard: FriendData {
		return instance
	}
	
	func init() {
		load()
	}
	
	func deinit() {
		save()
	}
}```

---
### 문서 끝 ( by 재성 )