# 패스트캠퍼스 강의 노트 42th ( 20170714 )

# GCD (Grand Central Dispatch)

> (한줄요약) `Concurrent`에 `async` 방식이어야 랜덤하게 실행된다.

 - 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법이다.
 - System에서 Thread관리를 알아서 해준다.
 - dispatch queue를 이용해 작업들을 컨트롤 한다.
 - work item : Closure를 활용해서 구현되어 있으며 queue를 생 성할때 꼭 같이 만들어야 한다.

## DispatchQueue
 - 모든 DispatchQueue는 first-in, first-out 데이터 구조이다.
 - DispatchQueue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.
 - Serial Queue와 Concurrent Queue 2종류로 나눌수 있다.
	 - 직렬 큐, 병렬 큐.

### `init`
```swiftpublic convenience init(label: String,                           qos: DispatchQoS = default,                    attributes: DispatchQueue.Attributes = default,          autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = default,                        target: DispatchQueue? = default)
let queue = DispatchQueue(label: “com.wing.queue")let queueOption = DispatchQueue(label: "com.wing.queue1", qos: .userInitiated)let queueAttri = DispatchQueue(label: "com.wing.queue2",                          attributes: [.concurrent, .initiallyInactive])
```

## Main dispatch queue
 - Main Thread를 가르키며 기본 UI를 제어하는 queue이다.
 - Serial 방식으로 들어온 순서대로 진행되며 앞에 작업이 종료될 생성때까지 뒤의 작업들은 대기 한다.### `init`
```swiftDispatchQueue.main.async {    // Do something}
```

## Global dispatch queue
 - app 전역에 사용되는 queue로서 Concurrent 방식의 `queue`

### `init`
```swift
let globalQueue = DispatchQueue.global()let globalQueue = DispatchQueue.global(qos: .userInitiated)
```

## DispatchWorkItem
 - 실행 할 수 있는 작업의 캡슐화.
 - 이벤트를 등록, 취소 할 수 있다.
 - dispatchQueue에서 실행 시킬수 있다.### `init````swiftpublic init(qos: DispatchQoS = default,          flags: DispatchWorkItemFlags = default,          block: @escaping @convention(block) () -> Swift.Void)
```

### `Sample code`
```swift
func useWorkItem() {
    var value = 10
    let workItem = DispatchWorkItem {
        value += 5 }
    workItem.perform()
    let queue = DispatchQueue.global(qos: .utility)
    queue.async(execute: workItem)
    workItem.notify(queue: DispatchQueue.main) {
        print("value = ", value)
    }
}
```

## Timer
 - `Queue`의 시작을 지연시키고 싶을 때.

```swift
let delayQueue = DispatchQueue(label: "com.wing.delayqueue", qos: .userInitiated)
    print(Date())
    let additionalTime: DispatchTimeInterval = .seconds(2)
    
    delayQueue.asyncAfter(deadline: .now() + additionalTime) {
        print(Date())
    }
    
    delayQueue.asyncAfter(deadline: .now() + 0.75) {
        print(Date())
    }
```

## `Sample` - 오늘의 예제 소스
```swift
let q1 = DispatchQueue(label: "com.blackturtle2.q1", qos: .unspecified)
let q2 = DispatchQueue(label: "com.blackturtle2.q2", qos: .background)
let q3 = DispatchQueue(label: "com.blackturtle2.q3", qos: .userInitiated)
q1.async {
    print("hi q1")
    for n in 100..<200 {
        print(n)
    }
}
    
q2.async {
    print("hi q2")
    for n in 200..<300 {
        print(n)
    }
}
    
q3.async {
    print("hi q3")
    for n in 300..<400 {
        print(n)
    }
    
    DispatchQueue.main.async {
        self.labelMain.text = "END Thread-!"
    }
}
    
let globalQueue = DispatchQueue.global()
    
globalQueue.async {
// 글로벌큐를 돌리고, 다른 뷰를 왔다갔다 하더라도 큐는 계속 돌고 있다.
    for n in 1...99999 {
        print(n)
    }
}
```

---
### 문서 끝 ( by 재성 )