//
//  ViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     /*
     /// UserDefaults 가이드라인 ///
     MyMemo.memo 를 Key로 가진 array 타입의 `UserDefaults`
     
     array 안에는 [[String:String]]으로 들어있고.
     Dictionary의 Key 값은 MyMemo.title과 MyMemo.content가 있다.
     */
    
    var vIndexPathRow:Int? // Cell을 Select 할 때, indextPath를 넘기기 위한 전역 변수.
    var vArrayData:[[String:String]]?
    var vDicData:[String:String]?
    
    @IBOutlet var mainTableview:UITableView? // 테이블 뷰 관리를 위해 IBOutlet 선언.
    
    // MARK: Memo를 추가하고 돌아왔을 때, TableView 다시 그리기
    override func viewWillAppear(_ animated: Bool) {
        vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) as? [[String : String]]
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
        
//        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) as? [[String : String]]
//        var vDicData:[String:String]?
        
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
        if UserDefaults.standard.array(forKey: MyMemo.memo) == nil {
//            tableView.cellForRow(at: indexPath)?.selectionStyle = .none //스타일 none 말고 다른 건 없을까. // 아래에 있네~
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        // 선택한 Cell의 indexPath.row 값 저장.
        vIndexPathRow = indexPath.row
        
        // 곧바로 performSegue 시작. Prepare editMemo로 넘어간다.
        performSegue(withIdentifier: "editMemo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 셀을 선택했을 때, "editMemo" Segue를 태운다.
        if segue.identifier == "editMemo" {
            let vc:AddMemoViewController = segue.destination as! AddMemoViewController
            
            vc.vIndexNumber = vIndexPathRow
            vc.isEdit = true
            
        }
        
    }
    
    // 초기화 버튼 액션 정의
    @IBAction func buttonMemoInitial(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: MyMemo.memo)
        viewWillAppear(true)
    }
}
