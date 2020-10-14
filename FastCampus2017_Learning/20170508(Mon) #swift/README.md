# 패스트캠퍼스 강의 노트 1st ( 20170508 )

# 컴퓨터 기초

## 컴퓨터 구조
1. `CPU`: Central Processing Unit
2. `RAM`: Random Access Memory
3. `ROM`: Read Only Memory
4. `ODD`: Optical Disk Drive
5. `VGA`: Video Graphics Array

## 프로그램 Vs 프로세스
 - 실행되느냐 or 실행되지 않느냐의 차이.
 - `프로그램`은 저장된 그 자체 / `프로세스`는 프로그램이 실행된 상태.

## Swift
 - `Swift`는 `Objective-C`와 같이 `LLVM`(feat. 컴파일러)로 빌드되고, 같은 `런타임`을 공유한다.
 - `Swift`는 **객체 지향형**, **함수형**, **프로토콜 지향형 프로그래밍**을 모두 다룰 수 있는 언어이다. 
 - 단, iOS 프레임워크는 `객체 지향형 프로그래밍`으로 구현되어 있어 객체 지향형 프로그래밍으로 하도록 권장한다.

### 컴파일과 런타임 알아보기
// 개인적인 알아보기..
> 컴파일러(compiler, 순화 용어: 해석기, 번역기)는 특정 프로그래밍 언어로 쓰여 있는 문서를 다른 프로그래밍 언어로 옮기는 프로그램을 말한다. - 참고: [컴파일러 - 위키백과, 우리 모두의 백과사전](https://ko.wikipedia.org/wiki/%EC%BB%B4%ED%8C%8C%EC%9D%BC%EB%9F%AC)
> 
> 런타임(영어: runtime→실행시간)은 컴퓨터 과학에서 컴퓨터 프로그램이 실행되고 있는 동안의 동작을 말한다. - 참고: [런타임 - 위키백과, 우리 모두의 백과사전](https://www.google.co.kr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0ahUKEwii7ePgmurTAhUHk5QKHRcXCVUQFgglMAA&url=https%3A%2F%2Fko.wikipedia.org%2Fwiki%2F%25EB%259F%25B0%25ED%2583%2580%25EC%259E%2584&usg=AFQjCNGcgKxX5R6OvQqq-qUDstiK-UzeWw&sig2=f0UH3d6MnkBjxDIWQtuC8A)

// 참고: [컴파일 타임과 런타임 _ 서광열의 C# 스쿨](https://csharpschoolblog.wordpress.com/2016/10/16/%EC%BB%B4%ED%8C%8C%EC%9D%BC-%ED%83%80%EC%9E%84%EA%B3%BC-%EB%9F%B0%ED%83%80%EC%9E%84/)
 
### 프로토콜 프로그래밍 알아보기
// 개인적인 알아보기.. ~나를 개발자로 인도해주신(?) 멋진(!)~ iOS 개발자님께 여쭤본..
> 프로토콜이 자바 인터페이스 개념하고 비슷한데 클래스 대비 벨류 타입이라 장단이 있고 제네릭이랑 같이 쓰면 꽤 유용하다... 정도 알겠네요.
> 실제로 스위프트 소스 열어보면 Equatable, Comparable 등등 프로토콜이 자주 보여요.
> 사실 obj-c 에서도 protocol은 꽤 자주 쓰였으니까요. delegate 패턴 구현할 때 많이 썼던.

// 참고: [[번역][Swift]프로토콜지향 프로그래밍](http://minsone.github.io/programming/protocol-oriented-programming)

// 참고: [Swift에서 프로토콜 중심 프로그래밍(POP)하기](https://news.realm.io/kr/news/protocol-oriented-programming-in-swift/)


---
### 문서 끝 ( by 재성 )