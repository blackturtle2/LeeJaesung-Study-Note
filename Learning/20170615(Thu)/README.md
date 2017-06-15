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


calendar.component(.month, from: Date()) // Int로 return 한다.


// cell의 textView의 델리게이트를 tableView의 cell을 그리는 부분에서 데려오고, cell의 200자 제한을 걸어버린다.

```swift
if cell.textView.delegate == nil {
	cell.textView.delegate = self
}
```
---
### 문서 끝 ( by 재성 )