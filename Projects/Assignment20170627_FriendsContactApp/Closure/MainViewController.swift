//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 데이터 모델링 통해서 구조화해야 함.
    
    @IBOutlet weak var tableViewMain: UITableView!
    var vArrayFriends:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // ***** 예외 처리 시작 ***** //
        guard let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") else {
            JS_ToolBox.showOkAlert(sender: self, title: "알림", massage: "친구가 1도 없네요. :P\r새 친구를 등록해주세요.", handler: { (action) in
                self.performSegue(withIdentifier: "moveDetailViewController", sender: nil)
            })
            return
        }
        // ***** 예외 처리 끝 ***** //
        
        vArrayFriends = vArrayTotalFriends as! [[String:String]]
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
        return vArrayFriends.count
    }
    
    // MARK: 테이블 뷰 Cell 그리기.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dicFriend = vArrayFriends[indexPath.row] 
        
        myCell.textLabel?.text = "\(dicFriend["Name"]!)"
        myCell.detailTextLabel?.text = "\(dicFriend["Age"]!)"
        
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

