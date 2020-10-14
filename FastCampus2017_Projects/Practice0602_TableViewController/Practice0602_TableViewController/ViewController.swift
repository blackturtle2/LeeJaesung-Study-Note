//
//  ViewController.swift
//  Practice0602_TableViewController
//
//  Created by leejaesung on 2017. 6. 2..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

