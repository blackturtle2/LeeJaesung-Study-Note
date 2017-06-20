# 패스트캠퍼스 강의 노트 30th ( 20170620 )

# 오늘의 팁

## DatePicker / DateFormatter

```swift
@IBAction func datePickerMain(_ sender: UIDatePicker) {
    let myDateFormat = DateFormatter()
    myDateFormat.dateFormat = "yyyy년 MM월 dd일 a h시 mm분"
        
    labelDateStatus.text = "\(myDateFormat.string(from: sender.date))"   
}
```

## Array 안에 있는 Dictionary 데이터를 가져오기
 - `FriendData`라는 싱글턴을 만들고, 관리한다.
 - `For`문을 돌면서 익셔너리의 값을 가져온다.

```swift
let data = FriendData.standard.object(forKey: "list") as! [Any]

for person in data {
	let personDic = person as! [String:Any]
	let name = personDic["name"] as! String
	let age = personDic["age"] as! Int
}
```

# -

## -## UITableView의 헤더뷰
 - 테이블 뷰의 위에 View 하나를 얹이면, 테이블 뷰의 헤더뷰가 된다.// Json 형태로 음악 앨범의 데이터 구조를 설계해봅니다.---
### 문서 끝 ( by 재성 )