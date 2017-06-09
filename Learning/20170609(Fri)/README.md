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
---
### 문서 끝 ( by 재성 )