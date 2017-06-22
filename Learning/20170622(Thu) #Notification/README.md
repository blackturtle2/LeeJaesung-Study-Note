# 패스트캠퍼스 강의 노트 31th ( 20170622 )

# Notification

## Notification Center
 - 특정 이벤트가 발생 하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스.
 - `addObserver`: 객체A가 노티피케이션 센터에 자신이노티피케이션을 받을 것이라고 등록.
 - `postNotification`: 객체B가 필요한 시점에 노티피케이션 송출.
 - 노티피케이션 센터에서 적절한 객체와 메소드를 찾아 호출.


### 깨알 Tip
 - `typealias`는 오른쪽 내용을 왼쪽과 같이 간단히 부르겠다는 뜻.
 - 기존에 `Obj-C`에서 `NSNotification`으로 있던 것을 `Swift`에서 사용하기 위해 타입얼라이언스를 주었다.
 - 그래서 우리는 `Notification.Name("postNoti")`로 해서 값을 넣으면, 실질적으로 값이 들어가고 구동되는 것은 `NSNotification`의 `Name`이 받는다.

```swift
public typealias Name = NSNotification.Name
```


## 예제 따라하기
 - 2개의 뷰가 있고, 두번째 뷰에서 `UISwitch`를 on/off 하면, 첫번째 뷰의 `UILabel`에 값이 표시된다.

### 2nd 뷰 컨트롤러
 - `UISwitch`를 on/off 하면, `NotificationCenter`에 `post`한다.
 - `name`에 `Notification.Name("postNoti")`을 준다.
 - `object`에는 String을 담아보는데, Any이므로 아무거나 담을 수 있다.

```swift   
@IBAction func SwitchAction(_ sender: UISwitch) {
    if sender.isOn {
        NotificationCenter.default.post(name: Notification.Name("postNoti"), object: "Change!!!")
    }else {
        NotificationCenter.default.post(name: Notification.Name("postNoti"), object: "Change!!!")
    }
}
```

### 1st 뷰 컨트롤러
 - `viewDidLoad()`할 때, `NotificationCenter`에 `addObserver`한다.
 - `Selector`는 `#selector(function name)`으로 작성한다.
 - `Selector`에 들어가는 함수는 미리 아래에서 함수를 만들고, 자동 완성으로 작성한다.

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.callNoti(_:)), name: Notification.Name("postNoti"), object: nil)   
}
```

### removeObserver()
 - 옵저버는 `addObserver()` 할 때마다 추가된다.
 - 따라서 뷰 컨트롤러가 `deinit`할 때나 메모리 워닝이 떴을 때, `removeObserver` 해주도록 한다.

#### `deinit`
```swift
deinit {
    NotificationCenter.default.removeObserver(self)
}
```

#### `didReceiveMemoryWarning`
```swift
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
    NotificationCenter.default.removeObserver(self)
}
```

---

## 클로져 예고편
```
{(`parameters`) -> `return type` in `statements`}
```

---
### 문서 끝 ( by 재성 )