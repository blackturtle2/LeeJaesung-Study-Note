# 패스트캠퍼스 강의 노트 25th ( 20170613 )


# Property

## 프로퍼티
 - 변수의 다른 이름
 - iOS, Swift에서만 프로퍼티라고 부른다.
 - 클래스, 구조체, 열거형등 전체적으로 사용되는 변수를 `프로퍼티`라고 부른다

## 프로퍼티의 종류
 - 저장 프로퍼티 (Stored Properties)
 - 연산 프로퍼티 (Computed Properties)
 - 타입 프로퍼티 (TypeProperties)

## 저장 프로퍼티 (Stored Properties) - 가장 일반적인 프로퍼티
 - 값을 저장하는 용도로 사용된다.
 - 클래스, 구조체에서만 인스턴스와 연관된 값을 저장한다. 초기값을 설정 할 수 있습니다.

```swift
struct FixedLengthRange {     var firstValue: Int     let length: Int}var rangeOfThreeItems:FixedLengthRange = FixedLengthRange(firstValue: 0, length: 3)
```

## 연산 프로퍼티 (Computed Properties) - 실제로 값을 저장하지 않지만, get, set 키워드를 통해서 값을 간접적으로 설정하거나 받을 수 있다.
 - 클래스, 구조체, 열거형에서 사용할수 있는 프로퍼티이다.
 - Stored 프로퍼티에 바로 저장하지 말고, 연산 프로퍼티에 던져서 안전한 데이터를 저장하는 것에 목적이 있다.
 - 커파일 에러로 `get only...`하던 것은 가져올 수만 있다는 뜻이다.

### `연산 프로퍼티 예제 01`

```swift
struct Point {     var x = 0.0, y = 0.0 }struct Size {     var width = 0.0, height = 0.0 }struct Rect {	var origin = Point()
	var size = Size()

	var center: Point {	     get {	         let centerX = origin.x + (size.width / 2)	         let centerY = origin.y + (size.height / 2)	         return Point(x: centerX, y: centerY)	     }	     set(newCenter) {	         origin.x = newCenter.x - (size.width / 2)	         origin.y = newCenter.y - (size.height / 2)	     }	}}
```

### `연산 프로퍼티 예제 02`
```swift
//예외처리가 안되어있지만.. 예외코드
struct MyClass {
    // 저장을 할 수 없기 때문에 저장 프로퍼티를 사용해야 한다.
    private var total:Int = 0
    private var kScore:Int = 0
    private var eScore:Int = 0
    
    private var subjectCount:Int = 0
    private var isInputKScore:Bool = true
    
    // 연산 프로퍼티
    var koreanScore:Int {
        get {
            return kScore
        }
        set(newScore) {
            if isInputKScore {
            
                if newScore <= 100 && newScore >= 0 {
                    kScore = newScore
                    total += newScore
                    subjectCount += 1
                    isInputKScore = false
                }
            }
        }
    }
    
    var average:Double {
        get {
            return Double(total)/Double(subjectCount)
        }
    }
}
```

```swift
//실행코드
    var myScore = MyClass()
    myScore.koreanScore = 100
    myScore.koreanScore = 50
    print(myScore.average)

```
#### Read Only 연산 프로퍼티 - 읽기 전용 연산프로퍼티 작성시 get 키워드 없이 바로 작성할 수 있다.
 - 쓰기 전용 연산 프로퍼티는 작성할 수 없다.

```swift  struct Cuboid {      var width = 0.0, height = 0.0, depth = 0.0      var volume: Double {          return width * height * depth      }}
```
### Property Observers - 프로퍼티 값의 변화를 감시하고 그에 따라 대응한다.
 - 초기값이 설정된 저장 프로퍼티에서 사용 가능하다.
 - 프로퍼티의 값이 설정될때마다 호출된다.
 - didSet, willSet 키워드를 통해 값 변화의 직전 직후를 감지 할 수 있다.
 - 값 이름 미지정시 oldValue, newValue가 기본값으로 지정된다.

```swiftvar changeValue:Int = 0{	didSet(oldV){      print("oldValue \(oldV)") // 0   }   willSet(willV)   {      print("newValue \(willV)") // 4	}
}changeValue = 4
```

## 타입 프로퍼티 (Type Properties) - 인스턴스의 속성이 아닌, 타입에 따른 속성을 정의 할수 있다.
 - static 키워드를 사용해서 값타입에서 타입 프로퍼티를 설정할수 있으며, class 키워드를 사용해서 클래스 타입에서 타입 프로퍼티를 설정할 수 있다.
 - 값을 가져올때는 클래스의 이름을 통해서 가져올 수 있다.

## Method - 메서드는 특정 타입에 관련된 함수를 뜻합니다.
 - 함수의 문법과 같다.
 - 인스턴스의 기능을 수행하는 인스턴스 메서드와 타입자체의 기 능을 수행하는 타입 메서드로 나눌 수 있습니다.

## self Property - 모든 인스턴스는 self 프로퍼티를 가지고 있다.
 - self 프로퍼티는 자기 자신을 가르키고 있는 프로퍼티이다.
 - 이를 사용해서 인스턴스 메소드 안에서 자기 인스턴스에 접근 할수 있다.

```swiftstruct Point {     var x = 0.0, y = 0.0     func isToTheRightOf(x: Double) -> Bool {         return self.x > x     }}
```

# Delegate & TableView
 - `Delegate`: A에서 만든 인스턴스(B)가 자기(B)가 해야 할 일을 프로토콜에서 정의된 메소드를 통해서 본인(B)을 만든 A에게 B의 할 일을 위임해서 하도록 하는 방법..
 - `TableView`: 뷰 컨트롤러는 테이블 뷰의 셀에 관심이 없는데, 테이블 뷰가 뷰 컨트롤러에게 위임했기 때문에 뷰 컨트롤러가 그려주는 것이기 때문이다.
 - `DataSource` 한테 테이블 뷰 구성에 필요한 놈을 받아서 구성을 하는 뷰를 테이블 뷰라고 한다.
 - 테이블 뷰의 가장 큰 특징은 `Reusable`이고, 화면에 Cell이 필요할 때(그려질 때) 큐에 만들어진 인스턴스가 있다면, 이를 **알.아.서** 재사용한다. 굉장히 스마트한 기능이지만, 어쨌든 알아서 한다.
 - 테이블 뷰와 뷰 컨트롤러는 계속 데이터를 서로 왔다갔다 한다.

---
### 문서 끝 ( by 재성 )