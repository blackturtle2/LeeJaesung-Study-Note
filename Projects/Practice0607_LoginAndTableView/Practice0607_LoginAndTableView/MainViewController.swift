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
    
    var vIndexPath:Int?
    
    
    @IBOutlet var mainTableview:UITableView?
    
    // MARK: Memo를 추가하고 돌아왔을 때, TableView 다시 그리기
    override func viewWillAppear(_ animated: Bool) {
        mainTableview?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Section의 개수.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Row의 개수
    // count를 계산하고, nil 이면, 1을 넣는다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var vCount = UserDefaults.standard.array(forKey: MyMemo.memo)?.count
        
        if vCount == nil {
            vCount = 1
        }
        
        return vCount!
    }
    
    // MARK: 셀 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        
        var vArrayData = UserDefaults.standard.array(forKey: MyMemo.memo) as? [[String : String]]
        var vDicData:[String:String]?
        
        if vArrayData == nil && indexPath == [0, 0] {
            vDicData = [MyMemo.memoTitle:"환영합니다!  첫 메모를 추가해주세요. ☝🏻"]
        }else {
            vDicData = vArrayData?[indexPath.row]
        }
        
        cell.textLabel?.text = vDicData?[MyMemo.memoTitle]
        
        return cell
    }
    
    // 테이블뷰의 Cell을 터치했을 때의 액션 정의
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vIndexPath = indexPath.row
        performSegue(withIdentifier: "editMemo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editMemo" {
            let vc:AddMemoViewController = segue.destination as! AddMemoViewController
            
            vc.vIndexNumber = vIndexPath
            vc.isEdit = true
            
        }
        
    }
    
}
