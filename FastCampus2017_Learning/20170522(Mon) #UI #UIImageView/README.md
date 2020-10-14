# 패스트캠퍼스 강의 노트 11th ( 20170522 )

# 오늘의 팁
 - `enum`은 단순한 데이터의 열거이고, Int 값으로 해당하는 값을 찾을 수 있다.
 - 클래스는 많이 나누어서 한 소스 안에 구분이 쉽도록 하자.
 - 각 버튼들을 기능으로 나누는 구조를 짤 때, `Switch-case`를 사용하면서 클래스 타입의 객체를 담고 있는 배열을 만들고, 버튼의 `Tag`로 해당 배열의 값을 꺼내 사용하는 구조로 짜도록 한다. ( feat. 자판기 프로젝트 코드 리뷰 중.. )

# UI Base Guide

## UIKit Framework
 - UI와 관련된 모든 것들은 이 프레임워크 안에 있다.
 - `NSObject - UIResponder - UIView` 의 순서로 상속 받고 있다.

## UIResponder
 - 객체의 이벤트에 대한 반응과 핸들의 인터페이스를 정의한 클래스이다.

```swift
open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
```

## UIView 메모
 - 가장 기본이 되는 `View`
 - `UIComponent`들의 조합으로 화면이 구성되며 UIView를 상속 받았다.
 - 즉, iOS 화면구성은 `UIView`의 집합으로 되어 있다.
 - `frame`은 `x, y, width, height`로 이루어져 있고, `bounds`는 객체의 사이즈를 가져올 때 많이 쓴다.
 - `clipToBounds`는 뷰를 넘어서는 이미즈는 표시하지 않는다.
 - `backgroundColor`, `isHidden`에서 투명한 컬러와 숨겨진 것의 차이는 실제하느냐의 차이이다.
 - `ViewController`는 최상위에 `rootView`를 갖는데, `rootView`는 화면 사이즈와 같고, 사이즈를 조정하기 어렵다.
 - `CG`의 약자는 코어 그래픽스..
 - ~자세한 것은 아래 예제들을 통해..~

## 예제 - #UIView #UILabel
```swift
let firstBox:UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 60))
firstBox.backgroundColor = UIColor.black
    
let firstFont:UILabel = UILabel(frame: CGRect(x: 15, y:firstBox.bounds.height/2, width: 100, height: 15))
firstFont.text = "Hello World"
firstFont.textColor = UIColor.white

self.view.addSubview(firstBox)
firstBox.addSubview(firstFont)
```
 - 사각형의 뷰를 하나 만들어서 `self.view`에 `addSubview`한다.
 - 라벨 하나를 만들어서 위에 만들어둔 뷰에 `addSubview`한다.
 - 부모 뷰가 있고, `Subview`의 개념으로 접근하고, Subview의 좌표값은 부모 뷰를 기준으로 한다.
 - `firstBox.bounds.height`처럼 `bounds`로 묶어서 해당 뷰의 크기를 알 수 있다.
 - `root view`에 있다면, `view.bounds.height`를 통해 디스플레이의 height 값을 알 수 있다.


## 예제 - #UIImageView
```swift
let gfriendImgV = UIImageView(frame: CGRect(x: 15, y: 250, width: 100, height: 100))
gfriendImgV.image = UIImage(named: "gfriend.jpg")
gfriendImgV.contentMode = .scaleAspectFit
gfriendImgV.backgroundColor = UIColor.gray
self.view.addSubview(gfriendImgV)
```
 - `contentMode`는 이미지를 이미지뷰에서 어떻게 표현할 것인지 판단한다.

### ContentMode
 - `UIViewContentMode.ScaleToFill`: 이미지의 비율을 무시하고, 이미지를 이미지뷰에 **맞는 크기로** 확대/축소한다. `//뷰 크기(Scale)에 꽉 채우다(Fill).`
 - `UIViewContentMode.ScaleAspectFit`: 이미지의 가로/세로 비율을 고정하고, 이미지를 **그대로** 확대/축소된다. `//외모(Aspect)를 피트(Fit)시키다.`
 - `UIViewContentMode.ScaleAspectFill`: 이미지의 가로/세로 비율을 고정하고, 이미지를 이미지뷰에 틈새가 없도록 **꽉차게** 확대/축소된다. `//외모(Aspect)를 꽉 채우다(Fill).`

## 예제 - for문 UI 그리기
```swift
for i in 1...5 {
    let gfriendImgV_4 = UIImageView(frame: CGRect(x: 15, y: i*100, width: 100, height: 100))
    gfriendImgV_4.image = UIImage(named: "gfriend.jpg")
    gfriendImgV_4.contentMode = .scaleToFill
    gfriendImgV_4.backgroundColor = UIColor.gray
    self.view.addSubview(gfriendImgV_4)
}
```
 - y 값을 for문으로 돌려서, 이미지뷰를 아래로 쭉 뿌린다.

---
### 문서 끝 ( by 재성 )