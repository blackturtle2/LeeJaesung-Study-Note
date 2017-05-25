# 패스트캠퍼스 강의 노트 14th ( 20170525 )

# 오늘의 팁
 - 하노이의 탑
 - 원판이 1개면, 출발지 --> 목적지
 - 원판이 1개가 아닌 경우
	 - n-1 개의 원판을 출발지에서 목적지를 거쳐 경유지로..
	 - n 번을 출발지에서 목적지로..
	 - n-1 개의 원판을 경유지에서 출발지를 거쳐 목적지로..

# Auto Layout

## contraint - Constraint: 각 뷰의 거리, 길이, 위치 등을 표현하기 위한 제약

![contraint](contraint.png)

### Attribute
![attribute](attribute.png)

### Multiplier - 비율을 통한 레이아웃 설정을 위한 속성

### Constant - 일정한 간격을 유지하기 위한 속성

### 공식
```
Item1.Attribute = 비율 X Item2.Attribute + 간격
```

---
### 문서 끝 ( by 재성 )