# 패스트캠퍼스 강의 노트 16th ( 20170529 )

# 오늘의 팁
 - `AutoLayout`을 할 때, 요소들을 그룹 지어서 `Root 뷰`가 아닌, **별도의 그룹핑한 뷰**에 넣어두면 작업이 조금 더 수월해진다.
 - 앱을 구동하고 있을 때, 콘솔에 무언가 print 같은 명령을 쳐보고 싶으면, 콘솔에서 `po`라는 명령어를 넣고, print(...) 하면 된다.

# Delegate & Protocol

## Protocol
> 프로토콜Protocol은 인터페이스입니다. 최소한으로 가져야 할 속성이나 메서드를 정의합니다. 구현은 하지 않습니다. 진짜로 정의만 합니다. - [출처](https://devxoul.gitbooks.io/ios-with-swift-in-40-hours/content/Chapter-3/protocols.html)

 - 프로토콜은 원하는 작업이나 기능을 구현되도록 메소드, 프로퍼티 및 기타 요구 사항의 청사진을 정의한다.
 - 특정 클래스를 만들 때 프로토콜을 명시하면 해당 프로토콜의 요구사항대로 메소드나 프로퍼티를 직접 구현해야 한다.
 - 클래스, 구조체, 열거형은 프로토콜을 채택하여, 정의된 요구사항을 구현해야 한다.
 - 예를 들어, `UITableViewDataSource`, `UITableViewDelegate`는 서로 다른 목적을 위해 디자인된 프로토콜이다.

> (한줄요약) 클래스는 서로 간에 상속을 받고, 그 때는 "부모와 자식" 관계라고 할 수 있다. 프로토콜은 "팀장과 팀원" 관계라고 할 수 있고, 팀원이 만들어야 할 액션(함수)들을 정의한다. 그리고 팀원(클래스) 끼리는 Delegate를 통해 위임을 주고 받고 하며, 액션을 정의(구현)하고 사용하고.. 그렇게 산다. (응?)

### Protocol 의 문법
 - 클래스는 `상속받았다`, 프로토콜은 `채택되었다`라고 표현한다.
 - 상속은 하나만 받을 수 있고, 프로토콜 채택은 여러개 할 수 있다.

```swift
protocol SomeProtocol {
// SomeProtocol 프로토콜의 정의    // protocol definition goes here}struct SomeStructure: SomeProtocol, AnotherProtocol {
// SomeProtocol 프로토콜을 채택한 SomeStructure 구조체    // structure definition goes here}class SomeClass: SomeSuperclass, SomeProtocol, AnotherProtocol {
// SomeSuperclass를 상속 받고, SomeProtocol과 AnotherProtocol 프로토콜을 채택한 SomeClass 클래스    // class definition goes here}
```

```swift
protocol SomeProtocol {     // protocol definition goes here     func someMethod(_ inputStr:String); // 프로토콜은 메소드를 정의만 한다.}
class SomeClass: SomeSuperclass, SomeProtocol {     // class definition goes here     func someMethod(_ inputStr:String) // 프로토콜을 채택한 클래스에서 해당 메소드를 구현한다.	 {         print(inputStr)     }}
```
### 참고 URL
 - [프로토콜 (Protocol) · 40시간만에 Swift로 iOS 앱 만들기](https://devxoul.gitbooks.io/ios-with-swift-in-40-hours/content/Chapter-3/protocols.html)
 - [Seorenn SIGSEGV_ Swift - 프로토콜(Protocols)](Seorenn SIGSEGV_ Swift - 프로토콜(Protocols))


## Delegate ( 델리게이트 )
 - 사전적인 의미
	 - `대표자` / `위임하다` / `뽑다`
 - `Delegate`는 클래스나 구조체에서 일부분의 할 일을 다른 인스턴스에게 대신 하게 하는 디자인 패턴이다.
 - `델리게이트 패턴`은 iOS 프로그래밍에서 **가장 보편적인 패턴**이다.
 - 단어의 뜻에서도 느껴지듯, 뭔가를 대신하는.. 그런 무언가(객체)이다.

> Cocoa나 Cocoa Touch에서 프로토콜이 가장 빈번하게 사용되는 예는 아무래도 Delegation(위임)인 것 같다. 서로 다른 클래스 간의 이벤트를 알려주기에 효과적인 패턴이기 때문이다. 특히 GUI를 개발한다면 이 딜리게이션은 꼭 필요한 개념이다. ... 다만 딜리게이션 패턴은 앞서 여러번 언급했지만 Cocoa 혹은 Cocoa Touch용 앱을 만들다 보면 빈번하게 이용하게되니 자동으로 체득될 것 같다. - [출처](http://seorenn.blogspot.kr/2014/06/swift-protocols.html)

### Application Delegate

![Deligate](Deligate.png)
> AppDelegate.swift - 위 스크린샷에서는 UIApplicationDelegate(프로토콜)란 놈을 사용하고 있고, 그 안에있는 다음의 메소드들을 호출하고 있다. - [출처](http://m.blog.naver.com/seotaji/220224427562)
> 
 - `Application Delegate`는 `UIApplication` 클래스를 대신하여 미리 정해진 시점에 특정한 일을 한다.
 - 모든 `iOS application`은 단 한개의 `UIApplication` 클래스의 인스턴스를 가지고 있다.
 - `UIApplication`은 특정 시간대에 **delegate의 특정 메소드를 실행** 한다.
 - 예를 들어, 만약 앱에서 **종료 직전에 어떤 동작을 하는 코드**가 필요하다면 `application delegate` 안에 있는 `applicationWillTerminate()`를 **구현**하면 된다.

### Delegate 최종 정리

 - `Cocoa Touch`는 많은 `Delegate`들을 만들어 놓았고, `Delegate` 안에는 **특정 시점에 동작을 하는 메소드들이 정의**되어 있다. 이 메소드들을 개발자가 호출해서 사용하면 된다.
 - 모든 Xcode 템플릿들은 개발자들을 위하여 `application delegate`를 만들고, 어플리케이션이 실행될 때 `UIApplication` **객체에 연결**시킨다.
 - 모든 `Delegate`는 구체적인 역할과 해야 할 작업이 있다.


### 참고 URL
 - [애플 스위프트(Apple Swift) Application Delegate - 네이버 블로그](http://m.blog.naver.com/seotaji/220224427562)
 - [SPARROWAPPS_ swift delegate 이해하기](http://mtsparrow.blogspot.kr/2016/01/swift-delegate.html)
 - [까칠코더 __ Swift 프로토콜 (Protocols)](http://kka7.tistory.com/27)
 - [앱 생명주기(App Lifecycle) vs 뷰 컨트롤러 생명주기(ViewController Lifecycle) in iOS](https://medium.com/ios-development-with-swift/%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-app-lifecycle-vs-%EB%B7%B0-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-view-lifecycle-in-ios-336ae00d1855)

---
### 문서 끝 ( by 재성 )