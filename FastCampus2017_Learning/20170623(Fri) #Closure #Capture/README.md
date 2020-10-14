# 패스트캠퍼스 강의 노트 32th ( 20170623 )

# 오늘의 Tip

## Alert & Closure
 - `Alert`에서 `UIAlertAction`의 `handler`에 `Closure`를 사용한다.

```swift
let alert:UIAlertController = UIAlertController(title: "알림", message: nil, preferredStyle: .alert )
let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(sender: UIAlertAction) in print("push ok")})
        
alert.addAction(okAction)
        
self.present(alert, animated: true, completion: {print("present")})
```

 - `present()`에서 `completion`에는 return이 없는 Closure를 사용하도록 되어 있다.
 - 여기서 내비게이션 컨트롤러의 push를 태우거나 segue를 태울 수도 있다.

```swift
self.present(alert, animated: true, completion: {print("present")})
```

## Notification을 이용해서 키보드 내리기
 - `NotificationCenter`의 `Name`에서 `Notification.Name.UIKeyboardWillShow`를 사용하면, 키보드가 올라올 때, 노티를 받을 수 있다.
 - 이를 활용하면, 키보드의 높이도 구할 수 있고, 키보드 위에 별도의 `UIView`를 붙이는 것도 충분히 가능하다.
 - 그러나, `UITextView`를 터치해서 키보드가 올라올 때, 텍스트뷰가 함께 올라오도록 하고 싶다면, TextView 안에 있는 악세사리(?)를 이용해보도록 하자.

---

# Closure

## 중첩함수

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {    func stepForward(input: Int) -> Int { return input + 1 }    func stepBackward(input: Int) -> Int { return input - 1 }    return backward ? stepBackward : stepForward}
```

```swift
var currentValue = -4let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)// moveNearerToZero now refers to the nested stepForward() functionwhile currentValue != 0 {	print("\(currentValue)... ")	currentValue = moveNearerToZero(currentValue)}
```
 - **삼항 연산자** `return backward ? stepBackward : stepForward`
	 - : `backward`가 `true`이면, `stepBackward`을 `return`하고, `false`이면, `stepForward`를 `return`한다.
 - `let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)`
	 - : `backward`가 `false`이므로 `stepForward`를 리턴하고, `moveNearerToZero` 변수에는 `stepForward()`가 들어간다. **변수에 함수가 들어갔다!!!**
 - 그리고는 아래 `while`문을 처음 만났을 때, `print`를 한번 찍고(`-4`) `currentValue`에 `stepForward()`가 들어가 있으므로 `-3`을 리턴한다.
 - 다음 `while`문에서 `-3`을 `print`하고, 다시 `moveNearerToZero()`를 탄다.

## Closure

> Closures are self-contained blocks of functionality that can be passed around and used in your code. 클로저 는 코드에서 전달되고 사용할 수있는 독립적 인 기능 블록입니다.
> > Closures can capture and store references to any constants and variables fromthe context in which they are defined. 클로저는 정의 된 컨텍스트에서 모든 상수 및 변수 에 대한 참조를 캡처하고 저장할 수 있습니다.
> > Global and nested functions, as introduced in Functions , are actually special cases of closures. 글로벌 및 중첩 함수는 함수라고 설명했었으나 , 실제로는 클로져의 특별 한 종류이다.

### Closure Type
 - `Global function`는 이름이 있고 값을 캡처하지 않는 클로저입니다.
 - `nested function`는 이름을 가진 클로저로 내부 함수에서 값을 캡처 할 수 있습니다.
 - `Closure expressions`은 주변 컨텍스트에서 값을 캡처 할 수있는 간단한 구문으로 작성된 이름없는 클로저입니다.

### Closure Expression
```swift
{(`parameters`) -> `return type` in `statements`}
```

### Closure Example
```swift
self.present(nextVC, animated:true, completion:( () -> void )? )

let alert = UIAlertAction(title: "알림", style: .default,								handler: ((UIAlertAction) -> Void)? )UIView.animate(withDuration: 0.3,
					animations: () -> Void,  					completion: ((Bool) -> Void)?)
```

## Sorted(by:) Method
 - `Closure`를 설명할 때, `Sorted()`가 가장 무난한 예제로 뽑힌다.

```swift
func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
```

```swift
override func viewDidLoad() {	super.viewDidLoad()	let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]	
	func backward(_ s1: String, _ s2: String) -> Bool {		return s1 > s2	}
		let sorted = names.sorted(by: backward)	
	print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
}
```

```swift
let arrayTest = [234, 123, 345, 456, 567, 678]
        
        let arrayNewTest = arrayTest.sorted { (a:Int, b:Int) -> Bool in
            return a > b
        } // [678, 567, 456, 345, 234, 123]
```

## Closure 간소화

### `Type 제거`
 - `names.sorted()`는 어차피 String이 온다는 것을 알고있다.ㄷ

```swift let sorted = names.sorted(by:{ s1, s2 in return s1 > s2 })
```

### `return 제거` ( 한줄일 때 )
 - 어차피 Statements가 한줄이면, 당연히 리턴이 올 것이므로 제거.

```swift let sorted = names.sorted(by:{ s1, s2 in s1 > s2 })
```

### `Parameter 이름 제거`
 - 파라미터 이름도 짓기 귀찮으므로 한줄이면, `$0`으로 변수명도 제거.

```swift let sorted = names.sorted(by:{ $0 > $1 })
```

### ~모두 귀찮으면..~ `Operator Methods`
 - 파라미터 이름도 짓기 귀찮으므로 한줄이면, `$0`으로 변수명도 제거.
 - Operator Methods는 그 자체로 함수이므로 중괄호({})를 함께 제거한다.

```swift let sorted = names.sorted(by: > )
```

### `Trailing Closures`
 - 마지막 파라미터일 때, 엔터 버튼으로 자동 완성해보면, 마지막 파라미터의 이름이 사라지고, 액션을 정의할 수 있다.

```swift
func someFunctionThatTakesAClosure(closure: () -> Void) {    // function body goes here}
```

```swiftfunc someFunctionThatTakesAClosure(closure: {    // closure's body goes here})
```

```swiftfunc someFunctionThatTakesAClosure() {    // trailing closure's body goes here}
```

## Closure Example 1

```swift
func calculation(num1:Int, num2:Int, op(Int,Int) -> Int) -> Int {
	return op(num1, num2)
}

let add = {(f:Int, s:Int) -> Int in f + s}

print( calculation(num1: 10, num2: 20, op: add) )
print( calculation(num1: 10, num2: 20) {$0 + $1} )
print( calculation(num1: 10, num2: 20, op: +) )
```

## Closure Example 2

```swift
func testClosure(_ completion:(Bool) -> Void) {
        print("testClosure() 실행")
        
        if true {
            completion(true)
        }else {
            completion(false)
        }
    }

@IBAction func buttonStartAction(_ sender: UIButton) {
	testClosure { (isSuccess:Bool) in
	            if isSuccess == true {
	                print("isSuccess: true")
	            }else {
	                print("isSuccess: false")
	            }
	        }
}
```

---

# Capture
> 클로져 안에서 선언되고, 초기화된 변수, 함수에 대한 참조를 캡쳐하므로 외부에서 다시 사용하더라도 값에 영향을 끼치고, 값을 바꿀 수도 있다.
> 
> 일반적으로 우리가 알고 있는 함수 또한 클로져의 일종이며, `Global Function`이라고 한다. ( 상단의 Closure Type 참조 )

 - 클로져 안의 모든 상수와 변수에 대한 참조를 캡쳐해서 관리 한다.
 - `Swift`는 캡쳐를 위한 모든 메모리를 관리한다.

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {    var runningTotal = 0    func incrementer() -> Int {        runningTotal += amount        return runningTotal    }    return incrementer}

// ... //
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()// returns a value of 10incrementByTen()// returns a value of 20incrementByTen()// returns a value of 30
```

## 꿀팁 - 애니메이션이 끝난 후에 또 애니메이션 작동되기
```swift
UIView.animate(withDuration: 0.4, animations: { 
            // 애니메이션 액션 정의.
        }) { (isBool) in
            UIView.animate(withDuration: 0.5, animations: { 
                // 두번째 애니메이션 액션 정의.
            }, completion: { (isisBool) in
                // 끝나고 뭐할지.
            })
        }
```
---
### 문서 끝 ( by 재성 )