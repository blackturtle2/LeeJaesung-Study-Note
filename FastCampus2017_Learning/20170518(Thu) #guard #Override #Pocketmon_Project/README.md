# 패스트캠퍼스 강의 노트 9th ( 20170518 )

## 모닝 팁 ( Powered by 조교님 )
 - 클래스를 이해하기 위해, `유튜브 / 인스타그램 / 아이클라우드`과 같은 서비스의 `User`, `Post` 클래스를 만들어보자.
	 - `User` 클래스 안에 꼭 있어야 하는 변수들(userID, password 등)과 필수가 아닌 변수들(watchedVideo 등)을 둔다.
	 - `Post` 클래스 안에는 사용자가 포스팅하는 것에 필요한 변수들을 넣어본다.
	 - `init` 함수로 꼭 필요한 변수들을 받아서 저장하는 기능을 정의한다.
 - `var strArray2: Array<String> = Array<String>.init()`
	 - 변수를 선언하고, 초기화하는 원래 문법은 위와 같다.
	 - ~스위프트가 리터럴이 좀 강력(?)한 바람에..~

# Q&A 및 복습 타임

## guard 문
 - 가드문은 if-let으로 처리할 수 있었던 것을 `indent`가 너무 남발한다는 관점으로 탄생(?)하게 되었다.

```swift
func test(num:Int?) -> Int {
	guard let realNum = num else {
		//옵셔널일 때, 여기서 끝나고. 아니면, 가드문을 통과하고 지나간다. ( 다음 액션을 실행한다. )
		return
	}
	
	return realnum * realnum
}
```

# Override ( 재정의 )

 - `오버라이드`: 부모 클래스에 있는 같은 이름의 함수를 자식 클래스에서 재정의하는 것.
	 - 상속 관계가 있어야 한다.
	 - 부모 클래스에게서 물려받은 성질을 그대로 사용하지 않고, 자식 클래스에게 맞는 형태 또는 행위로 변경하여 사용할 수 있는 기능이다.
 - `오버로드`: 같은 함수의 이름을 재정의하는 것.
	 - 스위프트 고유의 것. Objective-C의 클래스(NSObject 등)을 상속 받으면, 불가능하다.

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```
 - `UIViewController`에 있는 `viewDidLoad()`라는 함수를 가져온다. ( 오버라이드 한다. )
 - `super`를 통해 부모 클래스에 있는 `viewDidLoad()`를 가져온다.

---
### 문서 끝 ( by 재성 )
