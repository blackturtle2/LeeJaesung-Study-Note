# 패스트캠퍼스 강의 노트 42th ( 20170714 )

# GCD (Grand Central Dispatch)

 - 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법이다.
 - System에서 Thread관리를 알아서 해준다.
 - dispatch queue를 이용해 작업들을 컨트롤 한다.
 - work item : Closure를 활용해서 구현되어 있으며 queue를 생 성할때 꼭 같이 만들어야 한다.

## DispatchQueue
 - 모든 DispatchQueue는 first-in, first-out 데이터 구조이다.
 - DispatchQueue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.
 - Serial Queue와 Concurrent Queue 2종류로 나눌수 있다.
	 - 직렬 큐, 병렬 큐.

## init
```swiftpublic convenience init(label: String,                           qos: DispatchQoS = default,                    attributes: DispatchQueue.Attributes = default,          autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = default,                        target: DispatchQueue? = default)
let queue = DispatchQueue(label: “com.wing.queue")let queueOption = DispatchQueue(label: "com.wing.queue1", qos: .userInitiated)let queueAttri = DispatchQueue(label: "com.wing.queue2",                          attributes: [.concurrent, .initiallyInactive])
```

---
### 문서 끝 ( by 재성 )