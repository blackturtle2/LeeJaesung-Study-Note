# 과제 - UITabelView 공식 문서 이해하기

// Xcode에서 <kbd>command</kbd> + <kbd>shift</kbd> + <kbd>0</kbd> 으로 공식 개발 문서에 접근할 수 있습니다.

# UITableView

계층적인 리스트로 정보들을 보여주고, 정보의 선택과 편집을 지원합니다.

## Overview

>  A table view displays a list of items in a single column. UITableView is a subclass of UIScrollView, which allows users to scroll through the table, although UITableView allows vertical scrolling only.
>  The cells comprising the individual items of the table are UITableViewCell objects;
>  UITableView uses these objects to draw the visible rows of the table.
>  Cells have content—titles and images—and can have, near the right edge, accessory views.
>  Standard accessory views are disclosure indicators or detail disclosure buttons;
>  the former leads to the next level in a data hierarchy and the latter leads to a detailed view of a selected item.
>  Accessory views can also be framework controls, such as switches and sliders, or can be custom views.
>  Table views can enter an editing mode where users can insert, delete, and reorder rows of the table.

테이블 뷰는 하나의 컬럼으로 아이템들을 리스트 형태로 보여줍니다. `UITableView`는 `UIScrollView`의 서브 클래스이며, 이것은 사용자로 하여금 테이블들을 스크롤 할 수 있게 해두며, `UITableView`는 세로 스크롤만 허용합니다.
각각의 테이블 아이템들을 포함하고 있는 셀들은 `UITableViewCell`의 객체입니다. `UITableView`는 이 객체들을 눈에 보이는 테이블의 row들로써 그리는데 사용합니다.
셀들은 콘텐츠를 가지고 있고(타이틀과 이미지), 오른쪽 끝에 액세서리 뷰들을 가질 수 있습니다.
표준 액세서리 뷰들은 인디케이터를 표시하거나 디테일한 버튼들입니다.
앞단에서는 데이터 하이라키에서 다음 레벨로 이끌어주고, 뒷단에서는 선택한 아이템의 디테일한 뷰를 보여줍니다.
또한, 액세서리 뷰들은 프레임워크 컨트롤이 될 수 있는데, 예를 들어, 스위치나 슬라이더 또는 커스텀 뷰까지 될 수 있습니다.
테이틀 뷰들은 편집 모드에 들어갈 수 있는데, 사용자는 이를 통해 삽입, 삭제, 재정렬이 가능합니다.


>  A table view is made up of zero or more sections, each with its own rows.
>  Sections are identified by their index number within the table view, and rows are identified by their index number within a section.
>  Any section can optionally be preceded by a section header, and optionally be followed by a section footer.

테이블 뷰는 0 이상의 섹션을 가지고 있고, 이는 각각의 행(row)들을 갖습니다.
센셔들은 테이블 뷰에서 각각의 index 넘버들로 가리킬 수 있고, 각 행들은 해당 섹션에서의 index 넘버로 가리킬 수 있습니다.
어떤 섹션이더라도 섹션 헤더가 앞에 옵션적으로 올 수 있고, 섹션 푸터 또한 옵션적으로 붙을 수 있습니다.


>  Table views can have one of two styles, plain and grouped.
>  When you create a UITableView instance you must specify a table style, and this style cannot be changed.
>  In the plain style, section headers and footers float above the content if the part of a complete section is visible.
>  A table view can have an index that appears as a bar on the right hand side of the table (for example, "A" through "Z").
>  You can touch a particular label to jump to the target section.
>  The grouped style of table view provides a default background color and a default background view for all cells.
>  The background view provides a visual grouping for all cells in a particular section.
>  For example, one group could be a person's name and title, another group for phone numbers that the person uses, and another group for email accounts and so on.
>  See the Settings application for examples of grouped tables.
>  Table views in the grouped style cannot have an index.

테이블 뷰들은 2가지 스타일을 갖습니다. 하나는 `Plain`, 다른 하나는 `Grouped`.
당신이 `UITableView` 인스턴스를 하나의 테이블 스타일로 지정하여 만든 것은 다시 수정할 수는 없습니다.
plain 스타일에서 완벽한 섹션의 부분이 보인다면, 섹션 헤더와 푸터는 콘텐츠 위에 뿌려집니다.
테이블 뷰는 index를 가질 수 있는데, 이는 테이블의 오른쪽  부분에 바 형태로 보여집니다. ( 예를 들어, A부터 Z까지 )
당신은 이를 터치해서 특정한 레이블이 있는 섹션 목적지로 이동할 수 있습니다.
테이블 뷰의 Grouped 스타일은 기본 백그라운드 컬러와 모든 셀의 기본 백그라운드 뷰를 제공합니다.
백그라운드 뷰는 특정 섹션에서 눈에 보이는 모든 셀들의 그룹핑을 제공합니다.
예를 들어, 한 그룹은 어떤 사람의 이름과 타이틀을 가지고, 다른 그룹은 그 사람이 사용한 폰 넘버를 가지며, 또 다른 그룹은 이메일 계정을 갖는 등을 할 수 있습니다.
애플리케이션 세팅을 보면, 그룹 테이블의 예를 볼 수 있습니다.
그룹 스타일의 테이블 뷰는 **index를 가질 수 없습니다.**


>  Many methods of UITableView take NSIndexPath objects as parameters and return values.
>  UITableView declares a category on NSIndexPath that enables you to get the represented row index (row property) and section index (section property), and to construct an index path from a given row index and section index (init(row:section:) method).
>  Especially in table views with multiple sections, you must evaluate the section index before identifying a row by its index number.

`UITableView`의 많은 메소드들은 NSIndexPath 객체를 매개변수와 반환 값으로 취급합니다.
`UITableView`는 NSIndexPath의 한 카테고리로 선언 되는데, 이는 대표적인 행의 index와 섹션 index를 당신이 얻을 수 있고, 행의 인덱스와 섹션의 인덱스로부터 인덱스 패스를 만들 수 있다는 것을 의미합니다. (init(row:section:) method)
특히 다중 섹션을 갖는 테이블 뷰에서 당신은 그것들의 익덱스 넘버에 의한 행을 가리키기 전에 섹션 인덱스를 평가해야만 합니다.


>  A UITableView object must have an object that acts as a data source and an object that acts as a delegate;
>  typically these objects are either the application delegate or, more frequently, a custom UITableViewController object.
>  The data source must adopt the UITableViewDataSource protocol and the delegate must adopt the UITableViewDelegate protocol.
>  The data source provides information that UITableView needs to construct tables and manages the data model when rows of a table are inserted, deleted, or reordered.
>  The delegate manages table row configuration and selection, row reordering, highlighting, accessory views, and editing operations.

하나의 `UITableView` 객체는 데이터 소스와 델리게이트를 통해 움직이는 객체를 가져야만 합니다.
일반적으로 이 객체들은 각 애플리케이션의 델리게이트이거나 혹은 더 자주 커스텀 `UITableViewController` 객체입니다.
데이터 소스는 `UITableViewDataSource` 프로토콜을 채택해야만 하고, 델리게이트는 `UITableViewDelegate` 프로토콜을 채택해야만 합니다.
데이터 소스는 `UITableView`에게 정보를 제공하는데, `UITableView`가 행을 삽입, 삭제, 재정렬할 때, 테이블을 구성하고, 데이터 모델을 관리하는 데에 필요한 정보를 제공합니다.


>  When sent a setEditing(_ :animated:) message (with a first parameter of true), the table view enters into editing mode where it shows the editing or reordering controls of each visible row, depending on the editingStyle of each associated UITableViewCell.
>  Clicking on the insertion or deletion control causes the data source to receive a tableView(_ :commit:forRowAt:) message.
>  You commit a deletion or insertion by calling deleteRows(at:with:) or insertRows(at:with:), as appropriate.
>  Also in editing mode, if a table-view cell has its showsReorderControl property set to true, the data source receives a tableView(_ :moveRowAt:to:) message.
>  The data source can selectively remove the reordering control for cells by implementing tableView(_:canMoveRowAt:).

`setEditing(_ :animated:)` 메시지를 보낼 때(true의 첫번째 매개변수와 함께), 테이블 뷰는 편집 모드로 들어갑니다. 이는 편집 혹은 보여지는 각 행 컨트롤들의 재정렬을 보여주며, 각 조합된 `UITableViewCell`의 편집 스타일에 의존합니다.
삽입이나 삭제 컨트롤을 클릭하는 것은 데이터 소스로 하여금 `tableView(_ :commit:forRowAt:)` 메시지를 받도록 합니다.
당신은 적합한 `deleteRows(at:with:)` 혹은`insertRows(at:with:)`을 호출함에 따라 삭제 혹은 삽입을 실행할 수 있습니다.

>  UITableView caches table-view cells for visible rows.
>  You can create custom UITableViewCell objects with content or behavioral characteristics that are different than the default cells;
>  A Closer Look at Table View Cells explains how.

`UITableView`는 보이는 행을 위한 table-view 셀들을 가지고 있습니다.
당신은 기본 셀들과는 다른 콘텐츠나 행동적 특징(함수?)들을 가진 커스텀 `UITableViewCell` 객체를 만들 수 있습니다.
자세히 보기 위해서는 Table View Cells 설명을 보세요.

>  UITableView overrides the layoutSubviews() method of UIView so that it calls reloadData() only when you create a new instance of UITableView or when you assign a new data source.
>  Reloading the table view clears current state, including the current selection.
>  However, if you explicitly call reloadData(), it clears this state and any subsequent direct or indirect call to layoutSubviews() does not trigger a reload.

`UITableView`는 `UIView`의 `layoutSubviews()` 메소드를 오버라이드하고, 이것은 당신이 새로운 `UITableView` 인스턴스를 만들 때나 당신이 새로운 데이터 소스를 할당할 때에만, `reloadData()`를 호출합니다.
테이블 뷰를 새로 로딩한다는 것은 현재 선택을 포함하여, 현재 상태를 초기화(clear)한다는 것을 말합니다.
그러나 당신이 명시적으로 `reloadData()`를 호출할 경우, 이것은 현재 상태와 다음에 이어지는 그 어떤 직접적인 혹은 간접적인 `layoutSubviews()`의 호출이 새로고침 하는 트리거가 되지 않음이 명백하게 됩니다.

> For information about basic view behaviors, see View Programming Guide for iOS.

베이직한 뷰의 행동의 정보가 필요하다면, iOS를 위한 View Programming Guide를 살펴보시길 바랍니다.

### State Preservation
상태 유지

>  If you assign a value to a table view’s restorationIdentifier property, it attempts to preserve the currently selected rows and the first visible row.
>  The table’s data source may adopt the UIDataSourceModelAssociation protocol, which provides a way to identify a row’s contents independent of that row’s position in the table.
>  If the table’s data source adopts the UIDataSourceModelAssociation protocol, the data source will be consulted when saving state to convert the index paths for the top visible row and any selected cells to identifiers.
>  During restoration, the data source will be consulted to convert those identifiers back to index paths and reestablish the top visible row, and reselect the cells.
>  If the table’s data source does not implement the UIDataSourceModelAssociation protocol, the scroll position will be saved and restored directly, as will the index paths for selected cells.

만약, 당신이 테이블 뷰의 `restorationIdentifier` 프로퍼티에 값을 할당한다면, 그것은 현재 선택된 행과 첫번째 보이는 행의 유지를 시도합니다.
테이블의 데이터 소스는 `UIDataSourceModelAssociation` 프로토콜을 채택할 수 있고, 이것은 테이블에서 행의 위치와 상관 없이 행의 콘텐츠를 정의하는 방법을 제공합니다.
만약, 테이블의 데이터 소스가 `UIDataSourceModelAssociation` 프로토콜을 채택한다면, 맨 위에 표시되는 행과 어떤 선택된 셀의 식별자를 위한 익덱스 패스가 전환되기 위해 상태가 저장될 때, 데이터 소스는 참고 될 것입니다.
복원하는 동안, 데이터 소스는 그들의 식별자들을 익덱스 패스 뒤로 전환시키고, 눈에 보이는 최상단 행을 복구시키고, 셀들을 재선택하기 위해 참고될 것입니다.
테이블의 데이터 소스가 `UIDataSourceModelAssociation` 프로토콜의 도구가 아니라면, 스크롤 위치는 저장될 것이고, 직접적으로 복원될 것이며, 선택된 셀들의 인덱스 패스도 마찬가지입니다.

>  For more information about how state preservation and restoration works, see App Programming Guide for iOS.

상태 유지와 재사용하는 방법에 대한 정보들을 찾는다면, App Programming Guide for iOS를 살펴보시길 바랍니다.

>  For more information about appearance and behavior configuration, see Table Views.

디자인(appearance)와 행동적 설정에 대한 자세한 정보는 Table Views를 살펴보시길 바랍니다.