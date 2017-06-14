# 패스트캠퍼스 강의 노트 26th ( 20170614 )


# Enum ( 열거형 )

## enum
 - 그룹에 대한 연관된 값을 정의하고 사용가능한 타입
 - 항목을 정의한다.
 - 원시값(rawValue)이라는 형태로 실제 값(정수, 실수, 문자등)을 부여 할 수 있다.

### 문법

```swift
enum <열거형 이름> {	case <열거 항목1>
	case <열거 항목2>
	case <열거 항목3>}
```

### 예시

```swift
enum CompassPoint {    case north    case south    case east    case west}
enum Planet {    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune}

// 사용 예시
var directionToHead = CompassPoint.west
directionToHead = .north
```

 - `directionToHead`의 타입은 `CompassPoint`
 - 각 `case`값만 들어 갈수 있으며, 선언 후 점( . )문법을 통해 쉽게 다른 값을 설정 할 수 있다.

## enum을 switch문에서의 사용
 - enum은 switch와 함께 할 때, 극강의 효율성을 발휘한다.
 - 열거형의 모든 case가 제공될때 default 값은 제공될 필요가 없다.

```swift
switch directionToHead {    case .north:        print("Lots of planets have a north")    case .south:        print("Watch out for penguins")    case .east:        print("Where the sun rises")    case .west:}print("Where the skies are blue")
```

## [예제] ToolBox 클래스를 만들어서 ShowAlert() 불러오기

### `JsToolBox`

```swift
enum AlertType {
    case loginFail
    case loginSuccess
}

class JsToolBox {
    
    func showAlert(type: AlertType, sender: UIViewController) {
        let alert = UIAlertController(title: titleMsg(for: type), message: titleMsg(for: type), preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(action)
        
        sender.present(alert, animated: true, completion: nil)
    }
    
    func titleMsg(for type:AlertType) -> String {
        var result:String?
        
        switch type {
        case .loginFail:
            result = "로그인이 실패하였습니다."
        case .loginSuccess:
            result = "로그인 성공"
        }
        
        return result!
    }
}
```

### `ViewController`

```swift
class ViewController: UIViewController {
    
    var jsToolBox:JsToolBox = JsToolBox()

// ... //

    @IBAction func buttonOkayAction(_ sender:UIButton) {
        jsToolBox.showAlert(type: .loginSuccess, sender: self)
    }
    
}
```

## enum의 활용
 - enum의 타입을 지정해주면, raw 값을 꼭 넣어야만 한다.

```swift
// MARK: enum 정의.
enum Barcode {    case upc(Int, Int, Int, Int)    case qrCode(String)}

// ... //

// MARK: 값 저장.
func saveCode() {
	var productBarcode = Barcode.upc(8, 85909, 51226, 3)	productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
}

// ... //

// MARK: enum 활용하기.
func action(code: Barcode){
	switch code {
	case .upc(let x, let y, let z, let a):
		print("회사 아이디는 \(y)")
	case .qrCode(let data):
		print("qrcode")
	default:
		print("유효하지 않은 데이터")
	}
}

func printEnum() {
	switch productBarcode {	     case .upc(let numberSystem, let manufacturer, let product, let check):	         print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).”)	     case .qrCode(let productCode):	         print("QR code: \(productCode).")	}
}
```

## 기억하기
 - enum의 문법을 기억하자.
 - enum의 Raw Value를 기억하자.
 - enum의 사용법을 익히고, switch문에서의 활용법을 익히자.

---

### `혼잣말`
// 내 스스로에게 과제 주기 - 페이스북처럼, 테이블 뷰에서 어떤 Cell은 사진, 다른 Cell은 텍스트만 보이게 하고, 각 셀은 좋아요/댓글/공유 기능의 버튼들이 있다. Cell의 디자인 형태는 enum의 값으로 받아온다.

---
### 문서 끝 ( by 재성 )