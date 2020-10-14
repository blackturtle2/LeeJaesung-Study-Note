# Memo
- 감시자 패턴은 여러 개체의 상태 변화를 감지하는 역할을 하나의 개체가 담당하게 하는 패턴이다.
- 감시자(Observer)는 다른 개체의 상태 변화를 **통보** 받는 역할과 이 변화를 구독하기 원하는 개체에게 **알려주는** 역할을 한다.
- 다른 개체의 상태 변화에 따라 의존하는 개체가 있다면, 감시자 패턴을 고려한다.
- 주체 개체 → Subject / 구독 개체 → Observer
- 시간 데이터가 있고, 이 데이터를 기반으로 표시하는 아날로그 시계와 디지털 시계가 있다고 할 때, 시간 데이터가 Subject, 각 시계가 Observer이다.
- 

# References
- [GoF의 디자인 패턴 (Summary) - 9. 감시자(Observer)](https://scvgoe.github.io/2018-12-24-GoF%EC%9D%98-%EB%94%94%EC%9E%90%EC%9D%B8-%ED%8C%A8%ED%84%B4-(Summary)-9.-%EA%B0%90%EC%8B%9C%EC%9E%90(Observer)/)
- [[디자인 패턴] 감시자 패턴 (observer pattern)](https://cpp11.tistory.com/54)
  - Subject 클래스를 상속한 Picture 클래스.
  - Observer 클래스를 상속받아 만든 ToneViewer, BrightnessViewer, SaturationViewer 클래스들.
  - Picture 클래스에서 특정 이벤트가 일어나면, Notify() 함수 호출.
  - 구독중인(Subscribe) 모든 클래스에게 통보된다.
  - 그독중인 클래스들은 Update() 함수를 호출하고, 알아서 동작한다.
  - Subject와 Observer 간의 의존도가 없고, Subject는 Observer 목록만 관리하면 된다.
- [[GoF디패] 19. 감시자(Observer) 패턴](https://newsdu.tistory.com/entry/GoF%EB%94%94%ED%8C%A8-19-%EA%B0%90%EC%8B%9C%EC%9E%90Observer-%ED%8C%A8%ED%84%B4)
  - 시계 예시.
