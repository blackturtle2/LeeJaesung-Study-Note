# 패스트캠퍼스 강의 노트 23th ( 20170609 )

# 오늘의 팁
## `페어프로그래밍 코드 리뷰`
 - `UserDefaults`에서 값을 가져올 때, `cell`을 구현하는 코드에서 작성하지 말자. cell을 구현하는 코드에서 계속 데이터를 불러오면, 리소스 낭비가 심하다.
 - `Struct`에다가 `key`값만 담지 말고, 데이터 구조([[String:String]]) 같은 것도 넣어보자.
 - `textview`의 `text`는 이미 옵셔널 값을 받는다. 값이 `nil`이더라도 에러나지 않고, 뷰를 그리기 위해서이다. 따라서 우리가 값을 넣을 때도 굳이 바인딩을 할 필요 없다.
 - `override`는 내가 부모에 있는 함수에 추가적으로 뭔가 하겠다는 뜻이다.

## 오늘의 한마디
> 코드를 빨리 짜는게 문제가 아니라, 천천히 짜더라도 충분히 이해해야 한다.
> 앱이 작동되는게 문제가 아니라, 내가 이해하고 코딩하는 것이 중요하다.
> 앱 사이클을 이해하기 위해 delegate 안에 print()를 찍어서 모두 확인해본다. 애플이 설명해놓은 문장을 번역해서 함께 달아둔다.
> 더 이해를 돕기 위해 사이클을 종이에 직접 적어서 이해해보도록 한다.

--

# CustomView

 - `UIView`로 `Class`를 하나 만든다.
 - `awakeFromNib()`가 일종의 `init()`이라고 생각한다.
 - 스토리보드에서 버튼을 넣고, 버튼의 클래스를 `UIButton`에서 **내가 만든 클래스** 로 넣는다.

### Custom `UIButton`

```swift
import UIKit

class RoundButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }

}
```

### ViewController 에서 소스로 CustomButton 만들기
 - 위에서 만든 `RoundButton` 클래스로 객체를 만들고, 아래와 같이 루트뷰에 `addSubview()`한다.
	 - `self.view.addSubview(rbt)`
 - `self.view.subviews`의 Return 값은 **[UIView]** 이다. ~UIView 배열로 쌓인다!!!~
 - 따라서 아래와 같이 `inserSubview()`로 `UIView` 배열 0번째 `index`에 쌓는다.
	 - `self.view.insertSubview(rbt, at: 0)` 
	 - 이렇게 하면, 스토리보드에서 만든 `UIButton`보다 먼저 그릴 수 있고, 스토리보드에서 만든 `UIButton`보다 뒤에 그려진다.

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rbt = RoundButton.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        rbt.backgroundColor = UIColor.black
        
//        self.view.addSubview(rbt)

        self.view.insertSubview(rbt, at: 0)
    }
}
```
### 참고
### `awakeFromNib()` & `loadView` & `viewDidLoad` 공부하기
- 참고 링크: [우주신비 드림 팩토리 / Apps 로드시 실행 메소드 순서](http://wjsb.tistory.com/4)

> "(void) awakeFromNib{}": XIB화일이 객체가 생성된후 바로 불리게 되는뷰. 만약 XIB로 뷰를 생성하지 않았으면 불리우지 않음.
> 
> apple의 주석은 다음가 같다.
> 
> loadView : nib를 생성하지 않고, 프로그래밍으로 뷰계층을 만들경우에 사용하라.
> 
> viewDidLoad : view가 로드된 뒤에 추가적인 작업을 할때 사용하라.

--
### 오늘자 강의 몇가지 키워드 리서치

오늘 배운 몇가지 키워드를 애플 공식 사이트에서 읽어봤습니다.
가장 핵심적인 내용을 발번역(…)하고, 제 나름대로 이해한 부분으로 해석해봤습니다. ~맞는지 틀린지는 여러분의 몫으로..~

`loadView()`
https://developer.apple.com/documentation/uikit/uiviewcontroller/1621454-loadview

```
If you use Interface Builder to create your views and initialize the view controller, you must not override this method.
```
뷰를 만들거나 뷰컨트롤러를 초기화하는 데에 인터페이스 빌더를 사용하면, `loadView()`는 꼭 사용하지 않아도 된다.

~지금처럼 스토리보드를 쓰면 우리는 요놈을 쓸 일이 없을거야..~

`viewDidLoad()`
https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload

```
This method is called after the view controller has loaded its view hierarchy into memory. This method is called regardless of whether the view hierarchy was loaded from a nib file or created programmatically in the loadView() method. 
```
이 메소드는 뷰 컨트롤러가 메모리에 뷰 하이라키가 로드된 이후에 호출된다. 이 메소드는 뷰 하이라키가 nib 파일로부터 로드되거나 loadView() 메소드에 의해 프로그램적으로 만들어지던지 간에 상관 없이 호출된다.

~그냥 어쨌거나 호출되므로 사용하거라~

`awakeFromNib()`
https://developer.apple.com/documentation/objectivec/nsobject/1402907-awakefromnib

```
Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
```
인터페이스 빌더 아카이브(? 아마도 nib 파일..)나 nib 파일로부터 로드된 이후 서비스를 위한 리시버를 준비한다. (?)

~나머지를 읽고, 제 나름대로 이해한건.. 인터페이스 빌더를 통해 만들어진 UI들은 모두 awakeFromNib()을 하므로 커스텀 UI일 경우, 여기서 기본 세팅을 합니다.~

--

---
### 문서 끝 ( by 재성 )