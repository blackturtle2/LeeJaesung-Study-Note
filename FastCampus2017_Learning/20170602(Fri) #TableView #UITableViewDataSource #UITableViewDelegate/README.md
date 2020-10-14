# 패스트캠퍼스 강의 노트 20th ( 20170602 )

# 오늘의 팁

#### `로그인 프로젝트의 로그인 버튼 액션 로직`
 - `Dictionary` 타입을 `Element`로 가지고 있는 `Array`를 `UserDefaults`에 태워서 데이터를 관리한다.
 - `UserDefaults`에 데이터를 업데이트 할 때는 `Array` 변수를 만들어, `UserDefaults` 값을 가져온 후, 업데이트 원하는 값을 `Array`변수에 `append`한 뒤에, 다시 `UserDefaults`에 `set` 하도록 한다.

```swift
let userList:[[String:Any]] = UserDefaults.standard.Array(forKey: "UserList")

for user in userList{
	let userEmail:String = user[Authentification.email]!
	let pw:String = user[Authentification.password]!
	
	...
}
```

# Navigation Bar
 - 네비게이션 인터페이스를 관리하는 뷰 - `Navigation bar`의 외관은 `Customize`할 수 있다.
 - 하지만 `frame`, `bounds`, `alpha values`는 절대 직접 바꿀수 없다.

## Custom NavigationBar
// 내비게이션 바의 버튼들을 클릭-드래그로 추가하고, 버튼들을 커스텀할 수 있다.

1. `Left` - backBarButtonItem leftBarButtonItem2. `Center` - titleView3. `Right` - rightBarButtonItem


# Table View
 - 테이블 뷰는 스크롤 뷰를 상속 받는다.
 - 테이블 뷰는 `section`과 `row`로 주소를 구성하고, 하나의 `row`에는 하나의 `cell`이 들어간다.
 - `row`는 숫자이고, `cell`은 뷰이다.

## Plain Table Views & Grouped Table Views
### `Plain Table Views`
 - `iOS의 "전화" 앱 참고`.
 - 기본적인 `TableView`.
 - 여러개의 `Section`을 가질수 있다.
 - 한 `Section`에는 여러개의 `Row`를 포함하고 있다.
 - 각각의 `Section`에는 `Section`을 표시하는 `header`, `Footer title`을 사용할 수 있다.
 - `Section`을 빠르게 검색할수 있는 네비게이터 바를 `index list` 라고 부른다.

### `Grouped Table Views`
 - `iOS의 "설정" 앱 참고`.
 - 각 `Section`을 `Group`의 형태로 나타내는 테이블 뷰
 - 데이터의 디테일한 정보를 표현할때 많이 사용된다.

## Data Source - `UITableViewDataSource`
 - 프로토콜을 사용하여 테이블 뷰에서 보여줄 데이터를 관리할 대리인의 역할을 정의해 둔 것.
 - `@requires`
	 - 테이블 뷰의 각 **섹션별 열의 개수** 를 설정. ( Row 별 Cell 객체 )
 - `@optional`
	 - 테이블 뷰 **섹션의 개수** 를 설정.

## Delegate - `UITableViewDelegate`
 - 프로토콜을 사용하여 테이블 뷰의 대리자로써의 수행할 수 있는 역할들을 정의해 둔 것
 - 역할	1. 헤더 또는 푸터의 높이를 설정 : `Variable height support`	2. 헤더 또는 푸터 뷰를 제공 : `Section Informations`	3. **셀을 선택하였을 때 수행할 동작** 관리 : `Selection`	4. **셀의 삭제 될 때 수행할 동작** 등의 관리 : `Editing`	5. 기타 등등

## [ 예제 ] Table View 만들기 ( ver.A ) `feat. UIViewController`
 - `UIViewController`를 만들고, 스토리보드에서 `TableView`를 `RootView`에 얹힌다.
	 - 스토리보드에서 얹힌 `TableView`에 `Cell`을 함께 얹히고, `identifier`에 임의의 값을 준다. ( 아래 예제에서는 "ReuseCell"를 주었다. )
	 - 당연히 뷰 컨트롤러의 클래스를 연결한다.
 - `Class`를 선언하는 부분에서 `UIViewController`를 상속받고, `UITableViewDataSource`와 `UITableViewDelegate`를 데려온다.
 - DataSource와 Delegate를 데려왔으므로, 소스나 스토리보드에서 ViewController에 연결한다.
	 - 스토리보드에서 `TableView`로부터 **ctrl + Click Drag** 로 `ViewController`에 끌어서 `Delegate`와 `DataSource`에 연결한다. ( **절대 까먹지 말 것!!!** )
	 - Delegate 연결은 TableView 말고도 꼭 잊지 말고, 연결하도록 한다.

### TableView 조립법 기억하기
 - `numberOfSections(...) -> Int`: Section 개수를 리턴한다.
 - `tableView(... numberOfRowsInSection ...) -> Int`: `Section`에 들어가는 `Row`를 리턴한다.
 - `tableView(... cellForRowAt ...) -> UITableViewCell`: `Cell`을 만든다.
 - `tableView(... titleForHeaderInSection ...) -> String?`: `Section`의 `title`을 리턴한다.
 - `tableView(... heightForRowAt ...) -> CGFloat`: `Row`의 `height`을 리턴한다.

```swift
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {...}
	
    override func didReceiveMemoryWarning() {...}
    
    // TableView의 Section 개수 Return하기.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // TableView의 Section에 Row 개수 Return하기.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // TableView의 Cell 만들어주기.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    // TableView의 Section에 이름을 표시하기.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(section)
    }
    
    // TableView의 높이 조절
    // Delegate를 사용하기 위해, 위에 UITableViewDelegate를 잡아주고, 스토리보드에서 Delegate 연결도 해준다.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
```

## [ 예제 ] Table View 만들기 ( ver.B ) `feat. UITableViewController`
 - `Xcode`에서 `header` 파일을 만들 때, `UITableViewController`로 만들면, 필요한 요소들이 알아서(!!!) 추가된다. ~UIViewcontroller로 만들어서 김 빼지 말자~ ~그렇지만, 늘 그랬듯이 원리를 알아두고, 일부러라도 만들어보자.~
	 - 따라서 `DataSource`나 `Delegate`를 데려올 필요가 없다.
	 - 스토리보드에서 UITableViewController로 추가한 다음, `Attribute`에서 이 클래스를 연결한다.

### `Cell`를 터치하면, 디테일 뷰로 넘어가기
 - `Segue`로 연결하고, `UserDefaults`에 `Set`해서 값을 저장하는 방법으로 구현했으나, 딱히 좋은 방법은 아니다. ~UserDefaults는 파일이고, 따라서 사용자 아이폰의 용량을 우걱우걱 먹는다는 점을 잊지 말자.~
 - `NavigationController`을 `Embeded`시키고, `push`하면서 데이터를 같이 보내자.
	 - 스토리보드에서 Identifier로 뷰컨트롤러를 `instantiate`해서 객체화한다.
		 - `self.storyboard?.instantiateViewController()`
	 - 뷰 컨트롤러 객체를 만들 때, 이동시키려는 뷰 컨트롤러 타입으로 초기화하고, 따라서 다운캐스팅을 위해 `as!` 명령을 사용한다.
	 - 해당 뷰컨트롤러의 변수에 데이터를 담는다.
	 - 내비게이션 컨트롤러이므로 `push`시켜서 데이터와 함께 뷰를 보내버린다. ~보내버려??~
		 - `self.navigationController?.pushViewController()`

```swift
// Section 개수를 리턴한다.
override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

// Row 개수를 리턴한다.
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return PoketMonData.names.count
}

// Cell을 구현한다.
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellCell", for: indexPath)

    cell.textLabel?.text = PoketMonData.names[indexPath.row]
    cell.imageView?.image = UIImage(named: "\(indexPath.row + 1).png")

    return cell
}

// Row의 높이를 리턴한다.
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return (UIImage(named: "1.png")?.size.height)!/20
}

// Cell을 선택했을 때, UserDefaults에 저장.
// 다음 뷰로는 스토리보드의 Segue를 이용해서 넘어간다.
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    UserDefaults.standard.set(indexPath.row + 1, forKey: "SelectedPocketmon")
    
    // 클릭한 표시를 제거하는 액션
    tableView.deselectRow(at: indexPath, animated: true)
    
    
    // 내비게이션 컨트롤러를 이용해 데이터를 담아서 태우는 방법
//        let nextVC:ImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
//        
//        nextVC.imageViewPocketmon = String(indexPath.row + 1)
//        
//        self.navigationController?.pushViewController(nextVC, animated: true)

}
```
---
### 문서 끝 ( by 재성 )