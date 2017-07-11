# 패스트캠퍼스 강의 노트 40th ( 20170711 )

# SubScript

 - `Subscript`는 별도의 `setter/getter`없이 `index`를 통해서 데이터를 설정하거나 값을 가져오는 기능을 할 수 있다.
 - `Array[index] / Dictionary[“Key”]` 등의 표현이 `Subscript`이다.

## [ Sample ] `index를 통한 접근`

```swift
class Friends {      private var friendNames:[String] = []      subscript(index:Int) -> String		{		get {		              return friendNames[index]		          }		set {		              friendNames[index] = newValue		          }		}
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
   struct Matrix {        let rows: Int, columns: Int        var grid: [Double]
                init(rows: Int, columns: Int) {            self.rows = rows            self.columns = columns            grid = Array(repeating: 0.0, count: rows * columns)		}
		        subscript(row: Int, column: Int) -> Double {            get {                return grid[(row * columns) + column]            }            set {                grid[(row * columns) + column] = newValue		}
	}}
var metrix = Matrix(rows: 2, columns: 2)metrix[0,0] = 1metrix[0,1] = 2.5
```

---
### 문서 끝 ( by 재성 )