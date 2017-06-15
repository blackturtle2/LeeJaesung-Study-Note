# 패스트캠퍼스 강의 노트 27th ( 20170615 )

# 오늘의 팁

## DateFormat
```swift
// 날짜 도출하기
let format = DateFormatter()
//        format.dateFormat = "dd.MM.yy" //14.06.17
//        format.dateFormat = "MMMMd" //June14
format.dateFormat = "MMMM" //June
//        format.dateFormat = "MMM" //Jun
//        format.dateFormat = "MM" //06
//        format.dateFormat = "d" //14
    
let result = format.string(from: Date()) //June
print("result: \(result)")
```

# -

## -
---
### 문서 끝 ( by 재성 )