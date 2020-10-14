//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//

import UIKit

let cellIdentifier:String = "myCell"

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableViewMain: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\r[ ===== 데이터 점검 ===== ]")
        print(DataCenter.sharedInstance.dicFriendListData ?? "ERROR- no data")
        
        // ***** 예외 처리 시작 ***** //
        if DataCenter.sharedInstance.dicFriendListData == nil {
            JS_ToolBox.showOkAlert(sender: self, title: "알림", massage: "친구가 1도 없네요. :P\r새 친구를 등록해주세요.", handler: { (action) in
                self.performSegue(withIdentifier: "moveDetailViewController", sender: nil)
            })
            return
        }
        // ***** 예외 처리 끝 ***** //
        
        DataCenter.sharedInstance.loadData()
        tableViewMain.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Section의 갯수는 1개.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Row의 수는 Array 카운트.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.sharedInstance.dicFriendListData?.dicFriendList.count ?? 0
    }
    
    // MARK: 테이블 뷰 Cell 그리기.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        
//        let dicFriend = DataCenter.sharedInstance.dicFriendListData?.dicFriendList
//        myCell.textLabel?.text = "\(dicFriend?["Name"]!)"
//        myCell.detailTextLabel?.text = "\(dicFriend?["Age"]!)"

        return myCell
    }
    
    // MARK: 테이블 뷰 Cell 선택시, 편집으로 들어가기.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "moveDetailViewController", sender: nil)
    }
    
    // MARK: SegmentedControl 액션 정의.
    @IBAction func segmentedControlGenderValueChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
}

