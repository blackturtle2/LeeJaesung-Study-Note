# 패스트캠퍼스 강의 노트 41th ( 20170713 )

# Thread

> 스레드(thread)는 어떠한 프로그램 내에서, 특히 프로세스 내에 서 실행되는 흐름의 단위를 말한다. 일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 `멀티 스레드 (multi thread)`라고 한다.

## iOS Thread
 - 모든 app은 기본적으로 `main thread`를 가지고 있다.
 - use UIKit classes only from your app’s main thread.
 - 기본적인 UI 및 모든 행동은 `main thread`에서 실행된다.

## When we use
 - Network request/response
 - time control
 - image download/upload
 - long time actions


## 동기와 비동기
 - 비동기 (Asynchronous: 동시에 일어나지 않는, 非同期: 같은 시기가 아닌)
 - 동기 (synchronous: 동시에 일어나는, 同期: 같은 시기)### 디자인 패턴에 의한 비동기처리
- 델리게이트(delegate), 셀렉터(@selector), 블록(a.k.a 클로저, block), 노티피케이션(Notification)### 큐를 이용한 비동기처리 방법
 - GCD로 가능.
 - dispatch_sync(...), dispatch_async(...)

### 교착 상태
 - 교착 상태(膠着狀態, 영어: deadlock)란 두 개 이상의 작업이 서로 상대방의 작업이 끝나기만을 기다리고 있기 때문에 결과 적으로 아무것도 완료되지 못하는 상태를 가리킨다


# Multithread

 - `Thread` : 직접 thread를 만들어서 제어 하는 방식.
 - `GCD` : Closure 기반의 기법으로 코드 가독성이 좋고 간편하다. // GCD : Grand Central Dispatch.
 - `Operation` : GCD기반의 rapper Class. 간단하게 사용가능하고 고수준의 API를 제공한다. 성능이 느린 편.
	 - GCD는 C언어 기반의 문법으로 구성되어 있었다. ( Obj-C 시절에.. )
	 - GCD와 Operation 모두, Swift 시대를 맞이하여, 새롭게 탈바꿈하였기 때문에 둘 모두 사용하기 편리해졌다. 입맛에 맡게 골라서 사용할 것.
 - `performSelector`: Selector를 이용한 방식, ARC이전에 주로 사용한 방식이였으나 GCD 이후엔 많이 사용되진 않는다.
	 - Selector를 사용하기 때문에 권장하지 않는다.
 - `Timer` : 간단한 interval Notification를 제공해 주는 Class. 특이하게도 **Timer는 mainLoop에서 실행** 된다.

 - UI는 Main Thread에서만 작동된다.
 - 따라서 최종적으로 수업 때는 `GCD`만 진행한다.


---
### 문서 끝 ( by 재성 )