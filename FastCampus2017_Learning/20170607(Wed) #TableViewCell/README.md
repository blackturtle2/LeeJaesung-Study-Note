# 패스트캠퍼스 강의 노트 21th ( 20170607 )

# 오늘의 팁

## Dictionary in Array
 - `Dictionary` 타입의 `Element`를 `Array` 안에 넣어서 데이터를 관리하는 방법.
 - 추후, API 서버로부터 `JSON` 데이터를 받게 될 경우, 자주 사용된다.
 - `Save()`에서 `UserDefaults`에 `Dictionary` 타입을 갖는 `Array`를 `set`한다.
 - `load()`에서 `for`문을 돌거나 `TableView`에서 `indexPath`를 이용해 값을 불러낸다.

#### `save()`

```swift
func save(){
    var list:[[String:Any]] = UserDefaults.standard.array(forKey: "friendList") as! [[String:Any]]
    let newFriend:[String:Any] = ["Name":"Leejaesung"]
    list.append(newFriend)
    
    UserDefaults.standard.set(list, forKey: "friendList")
}
```

#### `load()`

```swift
func load(){
    var data:[[String:Any]] = UserDefaults.standard.array(forKey: "friendList") as! [[String:Any]]
    
    if data == nil {
        data = []
        UserDefaults.standard.set(data, forKey: "myFriends")
    }
    
    // 여기에서 Action 구현
    for item in data {
        print(item)
    }
    
}
```

# TableView

## Cell의 재사용

### DequeueReusableCell

#### `섹션별 row의 개수 리턴 코드 구현`
 - `numberOfRowsInSection`을 **기억** 하자. ( `tableView(...) -> Int` )

```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

#### `cell 구현`
 - `cellForRowAt`을 기억하자. ( `tableView(...) -> UITableViewCell` )

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

 - `row`의 개수를 `return 100` 하면, cell 구현 코드를 **100 번** 호출한다.
 - 그러나 `iOS`는 보이는 화면에만 호출되고, 사용자가 아래로 스크롤하면, 해당하는 부분의 Cell을 구현하기 위해 호출한다.
 - 즉, 화면에 10개의 cell이 보이면, 일단 10번만 호출한다. 그러나 맨 아래까지 스크롤하면, 결국 100번 호출하는 것은 맞다.
 - 결과적으로 쓸데 없는 인스턴스를 계속 만들어내고, 메모리를 계속 잡아먹는다. ~100개니까 다행이지, 20만개이면..~
 - 그래서 아래와 같이.. ~To Be Continue..~

#### `cell의 재사용`
 - `tableView.dequeueReusableCell`을 기억하자.
 - `Queue`에 들어있는 **사용 가능한(Reusable) cell**을 뽑아내서(dequeue) 사용한다.
 - 화면에 보이는 `cell`들을 만들어 놓고, 화면을 스크롤할 때, 재사용 가능한 `cell`이 큐에 있다면, 재사용하고, 그렇지 않으면 만들어낸다.
 - `Queue`를 사용하는 이유는 모든 `cell`이 똑같지는 않을 것이기 때문이다.

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    
    cell.textLabel?.text = String("\(indexPath.row)")
    
    return cell
}
```


## TableView, 오늘의 팁 모음

### `segue의 identifier를 구분하기`
 - 뷰컨트롤러 하나에는 `segue`가 여러개일 가능성이 크다.
 - 따라서 스토리보드에서 segue의 identifier를 주고, 이를 통해 구분해서 액션을 처리하도록 한다.

```swift
prepare...{
	if segue.identifier == ""{
	
	}else if...
}
```

### `오토 레이아웃을 IBOutlet으로 가져오기`
 - 오토레이아웃도 스토리보드에서 소스로 마우스 클릭-드래그를 사용해 `IBOutlet`으로 가져올 수 있다.
 - `self.view.layoutIfNeeded()`

### `테이블뷰의 Re-Load`
 - 테이블뷰를 `Re-load`하기 위해 `viewWillAppear()`에 `tableview.reloadData()`를 부른다.

### `소스 읽어보기 (이론편)`
##### `cell.imageView?.image = UIImage(named: "\(indexPath.row + 1).png")`
 - `UITableView`의 인스턴스가 `cell`이라는 변수에 들어갔다.
 - `imageView` 인스턴스 안의 `image`라는 프로퍼티에 `UIImage` 인스턴스를 넣을 것이다.
 - `UIImage` 초기 함수에 `named`라는 `argument`를 이용할 것이다.
 - `프로퍼티`라고 평소에 부르지만, 그 안에 값이 들어가게 되고, 그 값을 부를 때는 `인스턴스`라고 부른다.
 - `인스턴스`는 **클래스를 통해 메모리에 값을 올린 상태** 를 말하고, **그 값을 담는 공간** 을 `변수` 라고 부른다.

### `옵셔널 바인딩` ~뜬금 복습~
 - `옵셔널 바인딩`: **옵셔널을 벗긴다.**
 - 옵셔널 Int와 그냥 Int는 다른 값이어서 옵셔널 바인딩으로 옵셔널 변수, OpInt를 벗겨버리고, 그냥 Int에 값을 씌워버린다.
 - `if let vInt = OpInt { }`

--

// 과제 - 메인에 테이블뷰를 만들고, 로그인 or 회원가입 후에 테이블뷰에 친구 추가하는 것을 진행해본다.
---
### 문서 끝 ( by 재성 )