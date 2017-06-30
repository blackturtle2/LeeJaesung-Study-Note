//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myFriendList:FriendList?
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendList = DataCenter.sharedInstance.dicFriendListData
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print(myFriendList?.dicFriendList ?? "ERROR- no data")
        
        // ***** 예외 처리 시작 ***** //
        if myFriendList == nil {
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
        return (myFriendList?.dicFriendList.count)!
    }
    
    // MARK: 테이블 뷰 Cell 그리기.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dicFriend = myFriendList?.dicFriendList
        
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

