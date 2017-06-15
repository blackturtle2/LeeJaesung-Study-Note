# 패스트캠퍼스 강의 노트 27th ( 20170615 )

# 오늘의 팁

## DateFormat - 오늘 날짜 도출하기

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




## 커스텀 Cell의 Delegate 연결하기
 - cell의 textView의 델리게이트를 tableView의 cell을 그리는 부분에서 데려오고, cell의 200자 제한을 걸어버린다.

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomFirstCell
    
    if myCell.myTextfield.delegate == nil {
	 	 myCell.myTextfield.delegate = self
	 }
    
    return myCell
}
```

// 페어 프로그래밍 데이로 별도 수업은 진행하지 않았습니다.
// `calendar.component(.month, from: Date())` // Int로 날짜를 return 한다.---
### 문서 끝 ( by 재성 )