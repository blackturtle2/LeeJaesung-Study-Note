# 패스트캠퍼스 강의 노트 20th ( 20170602 )

# 오늘의 팁

#### `로그인 프로젝트의 로그인 버튼 액션 로직`

```swift
let userList:[[String:Any]] = UserDefaults.standard.Array(forKey: "UserList")

for user in userList{
	let userEmail:String = user[Authentification.email]!
	let pw:String = user[Authentification.password]!
	
	...
}
```

# Navigation Bar
 - 네비게이션 인터페이스를 관리 하는 뷰 - navigation bar의 외관은 customize 할 수 있다.
 - 하지만 frame, bounds, or alpha values는 절대 직접 바꿀수 없다.

## Custom NavigationBar
1. Left - backBarButtonItem leftBarButtonItem2. Center - titleView3. Right - rightBarButtonItem

// 내비게이션 바의 버튼들을 클릭-드래그로 추가하고, 버튼들을 커스텀할 수 있다.

# Table View
 - 테이블 뷰는 스크롤 뷰를 상속 받는다.
 - 테이블 뷰는 `section`과 `row`로 주소를 구성하고, 하나의 `row`에는 하나의 `cell`이 들어간다.
 - `row`는 숫자이고, `cell`은 뷰이다.


## Plain Table Views & Grouped Table Views
### `Plain Table Views`
 - `iOS의 "전화" 앱 참조`.
 - 기본적인 `TableView`.
 - 여러개의 `Section`을 가질수 있다.
 - 한 `Section`에는 여러개의 `Row`를 포함하고 있다.
 - 각각의 `Section`에는 `Section`을 표시하는 `header`, `Footer title`을 사용할 수 있다.
 - `Section`을 빠르게 검색할수 있는 네비게이터 바를 `index list` 라고 부른다.

### `Grouped Table Views`
 - `iOS의 "설정" 앱 참조`.
 - 각 `Section`을 `Group`의 형태로 나타내는 테이블 뷰
 - 데이터의 디테일한 정보를 표현할때 많이 사용된다.

## Data Source `UITableViewDataSource`
 - 프로토콜을 사용하여 테이블뷰에서 보여줄 데이터를 관리할 대리인의 역할을 정의해 둔 것
 - @requires
	 - 테이블 뷰의 각 섹션별 열의 개수를 설정 - Row별 Cell객체
 - @optional
	 - 테이블 뷰 섹션의 개수를 설정

## Delegate `UITableViewDelegate`
 - 프로토콜을 사용하여 테이블뷰의 대리자로써의 수행할 수 있는 역할들을 정의해 둔 것
 - 역할	1. 헤더 또는 풋터의 높이를 설정 : Variable height support	2. 헤더 또는 풋터 뷰를 제공 : Section Informations.	3. 셀을 선택하였을 때 수행할 동작 관리 : Selection	4. 셀의 삭제 될 때의 동작 등의 관리 : Editing	5. 기타 등등

### 예제 - Table View 만들어보기

```swift
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {...}
	
    override func didReceiveMemoryWarning() {...}
    
    // TableView의 Section 갯수 Return하기.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // TableView의 Section에 Row 갯수 Return하기.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // TableView의 Cell 만들어주기.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        //        cell.textLabel?.text = userFriendList?[indexPath.row]
        
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

```swift
override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return PoketMonData.names.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellCell", for: indexPath)

    cell.textLabel?.text = PoketMonData.names[indexPath.row]
    cell.imageView?.image = UIImage(named: "\(indexPath.row + 1).png")

    return cell
}
    
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return (UIImage(named: "1.png")?.size.height)!/20
}
    
/// Cell을 선택했을 때, UserDefaults에 저장하고, 다음 뷰로는 스토리보드의 Segue를 이용해서 넘어간다.
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    UserDefaults.standard.set(indexPath.row + 1, forKey: "SelectedPocketmon")
    
    // 클릭한 표시를 제거하는 액션
    tableView.deselectRow(at: indexPath, animated: true)
    
    
    // 이하 강사님 소스 참고
//        let nextVC:ImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
//        
//        nextVC.imageViewPocketmon = String(indexPath.row + 1)
//        
//        self.navigationController?.pushViewController(nextVC, animated: true)

}
```
---
### 문서 끝 ( by 재성 )