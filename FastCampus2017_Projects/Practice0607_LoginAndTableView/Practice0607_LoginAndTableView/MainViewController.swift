//
//  ViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

/************************************************************************************************************
 
  /// UserDefaults 가이드라인 ///
 // Ver 1.0 --> "MyMemo.memo" 를 Key로 가진 array 타입의 UserDefaults
 // Ver 2.0 --> "memo_\(id)" 의 형태로 Key를 가진 array 타입의 UserDefaults ( 사용자별 각각의 메모 관리 용도 )
 
 array 안에는 [[String:String]]으로 Element들이 들어있고, Dictionary의 Key 값은 MyMemo.title과 MyMemo.content가 있다.
 
*************************************************************************************************************/

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var vIndexPathRow:Int? // Cell을 Select 할 때, indextPath를 넘기기 위한 전역 변수.
    var vArrayData:[[String:String]]? // userDefaults를 담는 용도.
    var vDicData:[String:String]? // userDefaults의 element를 담는 용도.
    
    @IBOutlet var mainTableview:UITableView? // 테이블 뷰 관리를 위해 IBOutlet 선언.
    
    // MARK: Memo를 추가하고 돌아왔을 때, TableView 다시 그리기
    override func viewWillAppear(_ animated: Bool) {
        
        if !(UserDefaults.standard.bool(forKey: StringLogin.isLogin)) {
            performSegue(withIdentifier: "moveLogin", sender: nil)
            return
        }
        
//        vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) as? [[String : String]] // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        vArrayData = UserDefaults.standard.array(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!)) as? [[String : String]]
        mainTableview?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Section의 개수.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Row의 개수
    // count를 계산하고, nil 이면, 1을 넣는다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result:Int = 1
        
        if vArrayData?.count == nil {
            return result
        }else {
            result = (vArrayData?.count)!
        }
        
        return result
    }
    
    // MARK: 셀 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        
        if vArrayData == nil && indexPath == [0, 0] {
            vDicData = [MyMemo.memoTitle:"첫번째 메모를 추가해주세요. ☝🏻"]
        }else {
            vDicData = vArrayData?[indexPath.row]
        }
        
        cell.textLabel?.text = vDicData?[MyMemo.memoTitle]
        
        return cell
    }
    
    // 테이블뷰의 Cell을 터치했을 때의 액션 정의
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 맨 처음에 Cell을 터치하면, AddMemo로 이동하면서 죽는 버그 픽스.
//        if UserDefaults.standard.array(forKey: MyMemo.memo) == nil { // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        if UserDefaults.standard.array(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!)) == nil {
            tableView.deselectRow(at: indexPath, animated: true) // 테이블뷰 셀 선택 해제 애니메이션입니다.
            return
        }
        
        // 선택한 Cell의 indexPath.row 값 저장.
        vIndexPathRow = indexPath.row
        
        // 곧바로 performSegue 시작. Prepare editMemo로 넘어간다.
        performSegue(withIdentifier: "editMemo", sender: nil)
    }
    
    // MARK: 로그아웃 버튼 액션 정의.
    @IBAction func buttonLogoutAction(_ sender:UIButton) {
        UserDefaults.standard.removeObject(forKey: StringLogin.currentUserID)
        performSegue(withIdentifier: "moveLogin", sender: nil)
    }
    
    // MARK: 초기화 버튼 액션 정의
    @IBAction func buttonMemoInitial(_ sender: UIButton) {
//        UserDefaults.standard.removeObject(forKey: MyMemo.memo) // 사용자에 따른 메모 분리 작업 - UserDefaults 분리 ( 리팩토링 필요 )
        UserDefaults.standard.removeObject(forKey: MyMemo.memoKey(id: UserDefaults.standard.string(forKey: StringLogin.currentUserID)!))
        viewWillAppear(true)
    }
    
    // MARK: Segue Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 셀을 선택했을 때, "editMemo" Segue를 태운다.
        if segue.identifier == "editMemo" {
            let vc:AddMemoViewController = segue.destination as! AddMemoViewController
            
            vc.vIndexNumber = vIndexPathRow
            vc.isEdit = true
        }
        
    }
    
}
