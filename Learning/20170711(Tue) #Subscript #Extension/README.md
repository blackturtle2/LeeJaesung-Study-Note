# 패스트캠퍼스 강의 노트 40th ( 20170711 )

# SubScript

 - `Subscript`는 별도의 `setter/getter`없이 `index`를 통해서 데이터를 설정하거나 값을 가져오는 기능을 할 수 있다.
 - `Array[index] / Dictionary[“Key”]` 등의 표현이 `Subscript`이다.

## [ Sample ] `index를 통한 접근`

```swift
class Friends {
    private var friendNames:[String] = []
    subscript(index:Int) -> String
    {
        get {
            return friendNames[index]
        }
        set {
            friendNames[index] = newValue
        }
    }
}
let fList = Friends()fList[0] = "joo"
```

## [ Sample ] `Struct`

```swift
struct TimesTable {      let multiplier: Int      subscript(index: Int) -> Int {          return multiplier * index      }}
let threeTimesTable = TimesTable(multiplier: 3)print("six times three is \(threeTimesTable[6])")
```

## [ Sample ] `Multi Parameter`

```swift
struct CustomMatrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    
    init(aRows: Int, aColumns: Int) {
        self.rows = aRows
        self.columns = aColumns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    subscript(aRow:Int, aColumn:Int) -> Double {
        get {
            return grid[(aRow * aColumn) + aColumn]
        }
        set {
            grid[(aRow * aColumn) + aColumn] = newValue
        }
    }
    
}
    var myMatrix = CustomMatrix(aRows: 2, aColumns: 2)
    
    super.viewDidLoad()
        
    myMatrix[0,0] = 1
    myMatrix[0,1] = 2
        
    print(myMatrix[0,0])
```

# Extensions

 - Extensions 기능은 기존 클래스, 구조, 열거 형 또는 프로토콜 유형에 새로운 기능을 추가한다.
 - 확장의 개념.
 - 클래스를 나눈 것은 아니기 때문에, 각 프로퍼티나 메소드는 접근제한자의 영향을 받을 뿐, Extensions의 영향을 받지는 않는다.
 - Extensions은 프로토콜을 채택할 수도 있기 때문에, UITableViewDelegate 같은 것들은 UIViewController에서 따로 빼내서 정리한다면, 소스가 한결 심플해보일 수 있다.

```swift
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"
```

```swift
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task() }
    } }
3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!
```


# Generic

 - Array는 Generic이기 때문에 타입을 지정해주지 않으면 만들 수 없다.
 - 꺽쇠 `< >` 부분이 들어가면, 제네릭이라고 부른다.

## [ Sample ] T를 활용한 예제

```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) { let temporaryA = a
    a=b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"

```

## [ Sample ] 타입을 가리지 않는 Stack 만들기
 - 같은 함수인데, input 타입을 가리지 않고, 받아서 처리한다.
 - 같은 액션을 하는 함수하면, 제네릭으로 만들어서 효율적으로 관리할 수 있다.

```swift
struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct GenericStack<T> {
    var items = [T]()
    
    mutating func push(_ item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

// ViewDidLoad
var stringTest = GenericStack(items: ["kimsehwa"])
var intTest = GenericStack(items: [12])

class ViewController: UIViewController {
stringTest.push("ImFineThankyou")
intTest.push(13)

    override func viewDidLoad() {
        super.viewDidLoad()
        
		print(stringTest) //GenericStack<String>(items: ["kimsehwa", "ImFineThankyou"])
		print(intTest) //GenericStack<Int>(items: [12, 13])
	}
```

---
### 문서 끝 ( by 재성 )