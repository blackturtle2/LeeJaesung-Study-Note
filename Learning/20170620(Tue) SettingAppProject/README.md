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

## UITableView의 헤더뷰
 - 테이블 뷰의 위에 View 하나를 얹이면, 테이블 뷰의 헤더뷰가 된다.

---

# Mini Project - 앱 세팅 화면 만들기

## 요구사항 - `UITableView`를 이용해 뷰를 구성한다.
 - `Plist`를 이용해 UI 구성을 위한 데이터를 설계하고, 활용한다.
 - `enum`으로 Cell을 구분한다.
 - `Singleton` 패턴을 활용해, `Plist`로부터 데이터를 가져와서 테이블 뷰의 UI를 구성한다.## 결과 미리보기
![SettingApp.png](SettingApp.png)## UI 그리기
 - UI는 내비게이션 컨트롤러를 임베디드하고, 테이블 뷰를 넣은 뷰컨트롤러를 만든다.
 - 테이블 뷰에 프로토타입 셀을 3가지 넣고, Identifier로 구분한다.
 - ~UI는 늘 하던대로.. 잘.. 열심히..~

## `Plist`
 - Plist에는 `Array > Dictionary > String, Array > Dictionary` 구조로 이루어져 있다.

![SettingAppPlist.png](SettingAppPlist.png)

## `SettingCenter`
 - 데이터 모델링을 위한 `SettingCenter`을 구현한다.

### `enum`
 - `Cell` 구분을 위한 타입을 나눈다.
 - `enum`도 `SettingCenter`에서 정의한다.

```swift
enum SettingCellType:String {
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
    case BlueButton = "SettingBlueButtonCell"
    case RedButton = "SettingRedButtonCell"
}
```

### class `SettingCenter`
 - `Singleton` 패턴을 위해 상단에 `sharedSetting`을 선언하고, 초기화한다.
	 - `static let sharedSetting:SettingCenter = SettingCenter()`
	 - 다른 클래스에서 이 Singleton 사용을 위해서는 `SettingCenter.sharedSetting.~`을 활용한다.
	 - 예시: `SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)`
	 - 싱글턴은 **천상천하 유아독존 나만 존재하겠다** ~혹시 읽으시는 분 죄송합니다.. (_ _)~
 - `Plist` 설계를 참고하여, 필요하다고 생각되는 것들을 함수로 만들고, 후에 테이블 뷰를 그리면서 필요할 때, 만들어도 된다.
 - `Plist` 에서 데이터를 가져오기 위해 `init()`에서 `loadData()`를 호출하고, `loadData()`를 정의한다.
```swift
class SettingCenter {
    
    // Singleton.
    static let sharedSetting:SettingCenter = SettingCenter()
    
    var settingMenuDataList:[Any]?
    
    // section의 갯수 리턴.
    var sectionCount:Int {
        return settingMenuDataList?.count ?? 0
    }
    
    // section별 Row 갯수 리턴.
    func numberOfRows(in section:Int) -> Int {
        guard let sectionData = settingMenuDataList else {  return 1 }
        
        let dicSectionData:[String:Any] = sectionData[section] as! [String:Any]
        let arrayRowTitle = dicSectionData["Data"] as! [[String:String]]
        
        return arrayRowTitle.count
    }
    
    // section의 title 리턴.
    func titleFor(section:Int) -> String {
        guard let sectionData = settingMenuDataList else {  return "" }
        
        let dicSectionData:[String:Any] = sectionData[section] as! [String : Any]
        let sectionTitle = dicSectionData["SectionTitle"] as? String
        
        return sectionTitle ?? "섹션 이름 없음"
    }
    
    // row의 title 리턴.
    func titleFor(rowAtIndexPath indexPath:IndexPath) -> String {
        guard let sectionData = settingMenuDataList else {  return "" }
        
        let dicSectionData:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let arrayRowTitle = dicSectionData["Data"] as! [[String:String]]
        let rowTitle = arrayRowTitle[indexPath.row]["Content"]!
        
        return rowTitle
    }
    
    // 각 셀의 타입 가져오기.
    func typeOfCellFor(rowAtIndexPath indexPath:IndexPath) -> SettingCellType {
        guard let sectionData = settingMenuDataList else { return .Basic }
        
        let dicSectionData:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let arrayCellStyle = dicSectionData["Data"] as! [[String:String]]
        let cellStyle = arrayCellStyle[indexPath.row]["CellStyle"]
        
        return SettingCellType(rawValue: cellStyle!) ?? .Basic
    }
    
    // init()
    private init() {
        loadSettingData()
    }
    
    // Settings.plist 에서 데이터를 불러오기.
    func loadSettingData() {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] {
            
            self.settingMenuDataList = settingMenuDataList
        }
        
    }
    
}
```
#### [ Singleton 특집 ] `loadSettingData()` - 데이터 수정은 하지 않을 계획이기 때문에 `Bundle`에서 데이터를 로드하기만 하자.
 - path 변수에 `Bundle.main.path(forResource: "Settings", ofType: "plist")`을 넣어준다.
 - `NSArray(contentsOfFile: path)`을 이용해 번들에 값이 있다면..
 - `Singleton`에 번들로부터 가져온 값을 넣어준다.
	 - `Singleton`은 `self.settingMenuDataList`으로 호출한다.```swift
func loadSettingData() {
    if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
        let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] {
        
        self.settingMenuDataList = settingMenuDataList
    }
    
}
```

## `SettingViewController`
 - 설정 화면의 뷰 컨트롤러 정의. ( 위에 첨부한 스크린 샷의 메인 화면 구성 )
 - 앞서 만들어둔 `Singleton`을 잘 활용하여, 테이블 뷰를 구성한다.
 - `Cell`을 그릴 때, `plist`에 저장된 `cell`의 `type`으로 구분하여, `cell`을 그려주고, 특히 `UISwitch`가 있는 `cell`은 커스텀 cell로 잘 구분해 넣도록 한다.
	 - `UISwitch`를 위한 `delegate`도 `cell`을 그릴 때, 연결하도록 한다.

```swift
case .Switch:
        let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Switch.rawValue) as! SettingSwitchCell
        
        myCell.labelTitle?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
        myCell.delegate = self
```

### class `SettingViewController`
 - 테이블 뷰를 그리기 위해, `UITableViewDelegate`, `UITableViewDataSource`를 채택한다.
 - 테이블 뷰를 그리는 데에 필요한 함수들을 정의한다.
 - ~자세히 보면, `SettingCenter`에서 모두 정의한 것들을 호출만 한다.~ (...)

```swift
class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {
    
    // ... //
    
    // MARK: ********** UITableViewDataSource **********
    func numberOfSections(in tableView: UITableView) -> Int {
        return (SettingCenter.sharedSetting.settingMenuDataList?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedSetting.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedSetting.titleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = SettingCenter.sharedSetting.typeOfCellFor(rowAtIndexPath: indexPath)
        
        
        switch cellType {
        case .Basic:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Basic.rawValue)!
            
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            myCell.detailTextLabel?.text = "detailTextLabel test"
            myCell.selectionStyle = .none
            
            return myCell
            
        case .Detail:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Detail.rawValue)!
            
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            
            return myCell
            
        case .Switch:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Switch.rawValue) as! SettingSwitchCell
            
            myCell.labelTitle?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            myCell.delegate = self
            
            return myCell
            
        case .BlueButton:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.BlueButton.rawValue, for: indexPath)
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            return myCell
            
        case .RedButton:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.RedButton.rawValue, for: indexPath)
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            return myCell
        }
        
    }
```

## `SettingSwitchCell`
 - `Setting` 화면에서 `UISwitch`가 있는 커스텀 Cell을 정의한다.
 - `Switch`가 있는 `cell`의 형태는 기본적으로 존재하지는 않고, 더군다나 `switch`의 `value changed`를 뷰 컨트롤러 단으로 데려오기 위해서는 `delegate`가 필요하다.

### protocol `SettingSwitchCellDelegate`
 - `SettingSwitchCell` class를 정의하기 이전에 delegate 연결을 위한 프로토콜을 먼저 선언한다.
 - 이때, delegate 함수에는 cell을 태우고, 이 cell에는 `SettingSwitchCell`라는 class 자기 자신을 태우도록 한다. **이 부분이 키포인트!!!**
 - 추후에 이 방법은 cell 자신이 뷰 컨트롤러에게 자기 자신을 던지는 데에 사용된다. ~뷰 컨트롤러님, 저의 값이 변경되었으니, 이제 컨트롤러님 하고 싶은대로 하시지요..~

```swift
protocol SettingSwitchCellDelegate {
    func cellValueChanged(_ cell:SettingSwitchCell, isOn:Bool)
}
```

### class `SettingSwitchCell`
 - `Delegate 변수`의 선언을 **절대** 잊지 말자!!!

```swift
class SettingSwitchCell: UITableViewCell {

    var delegate:SettingSwitchCellDelegate?
    
    // ... //
}
```

### UISwitch의 `ValueChangeAction`
 - `UISwitch`의 값이 바뀔 때마다 프로토콜에 정의된 `cellValueChanged()`를 호출하고, 매개변수 cell에 자기 자신을 `self`로 태워보낸다. ~( 자기 자신을 태워보내는 것이 핵핵핵포인트이다!!! )~

```swift
@IBAction func switcherValueChangeAction(_ sender: UISwitch) {
    delegate?.cellValueChanged(self, isOn: sender.isOn)
}
```

### class `SettingViewController`
 - `delegate` 연결을 위해 프로토콜, `SettingSwitchCellDelegate`을 먼저 채택한다.
 - delegate 함수인 cellValueChanged()를 정의한다.
 - 사실은.. 아직 딱히 정의할 액션이 없어서 delegate가 잘 연결되었는지 확인하기 위해 print()만을 해보았다. ~그리고 잘 연결되었다.~

```swift
class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {

// ... //

// MARK: ********** SettingSwitchCellDelegate **********
func cellValueChanged(_ cell: SettingSwitchCell, isOn: Bool) {
    print("cellValueChanged \(isOn)")
}
```

// Json 형태로 음악 앨범의 데이터 구조를 설계해봅니다.---
### 문서 끝 ( by 재성 )