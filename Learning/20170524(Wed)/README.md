# 패스트캠퍼스 강의 노트 13th ( 20170524 )

# 오늘의 팁
 - 스토리보드, 레이블에서 텍스트를 넣은 후, 레이블 사이즈를 자동으로 맞추려면, <kbd>command</kbd> + <kbd>=</kbd> 을 누르면 된다.
 - `재귀 형태`는 메모리를 많이 먹지만, 연산은 적게 한다. 상대적으로 `for문`이 연산을 많이 한다.

# Classes & Structures ( 클래스와 구조체 )

> “Classes and structures are general-purpose, flexible constructs that become thebuilding blocks of your program’s code.You define properties and methods to add functionality to your classes and structuresby using exactly the same syntax as for constants, variables, and functions.”

1. 프로그램 코드 블럭의 기본 구조이다.
2. 변수, 상수, 함수를 추가 할수 있다. (두 구조의 문법 같음)
3. 단일 파일에 정의 되며 다른 코드에서 자동으로 사용 할수 있습니다. (접근 제한 자에 따라 접근성은 차이가 있다. internal 기본 접근제한자)
4. 초기 상태를 설정하기 위해 initializer가 만들어 지고, 사용자가 추가로 정의할 수 있다.
5. 사용 시 `인스턴스(instance)`라고 불린다.
6. 기본 구현된 내용에 기능을 더 추가해서 확장 할 수 있다. `(Extensions)`
7. 프로토콜을 상속받아 사용할수 있다. `(Protocols)`

- `Properties(프로퍼티)`는 클래스나 구조체를 정의하는 필수 요소.
- `Class`는 `Structure` 타입의 프로퍼티를 만들 수 있지만, `Structure`는 `Class` 타입의 프로퍼티를 만들 수 없다.

## Initialization ( 초기화 ) - #공통점
> Initialization is the process of preparing an instance of a class, structure, or enumeration for use.

1. 초기화는 인스턴스에 설정된 속성의 초기값을 설정과 초기화하는데 목적이 있다.
2. 클래스 및 구조체는 인스턴스로 만들어질 때 프로퍼티는 적절한 초기값으로 **모두 초기화 해야 한다**.
3. **모든 구조체**는 자동으로 `Memberwise Initializers`가 만들어 진다. ( 아래 예제 참고 )

```swift
struct Book {
    var name:String?
    var cost:Int?
    var isbn:UInt?
    
}

class BookStore {
    var name:String = ""
    var computerBooks:[Book] = []
    var address:String = ""
    
    func addBook(name: String, cost: Int) {
        let book:Book = Book(name: "책책책", cost: 10000, isbn: 98302)
        computerBooks.append(book)
    }
}
```
 - 스트럭트 Book에 별도 `Init`을 하지 않았는데, `Book(name: ...)`이 자동으로 만들어졌고, 실제 사용할 때, 이를 사용할 수 있었다.
 - `init(parameter)`을 여러개 만들어서 각각의 init을 가능하게 할 수 있다. ( 예: name만을 받는 init과 cost만을 받는 init 선언이 가능함. )

## 차이점 - #참조타입 #값타입

1. `Class`는 참조 타입이고, `Structure`는 값 타입이다.
2. `Class`는 상속을 통해 부모클래스의 특성을 상속받을수 있고, `Structure`는 상속을 받을 수 없다.
3. `Class`는 Type Casting을 사용할수 있고, `Structure`는 사용할 수 없다.
4. `Structure`의 프로퍼티는 instance가 var를 통해서 만들어야 수정 가능하다.
5. `Class`는 Reference Counting을 통해 인스턴스의 해제를 계산한다.
6. `Calss`는 deinitializer를 사용할수 있습니다.


---
### 문서 끝 ( by 재성 )