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
     MyFriend.personInfo 를 Key로 가진 array 타입의 UserDefaults
     
     array 안에는 [[String:String]]으로 들어있고.
     Dictionary의 Key 값은 MyFriend.name과 MyFriend.id가 있다.
     */
    
    @IBOutlet var mainTableview:UITableView?
    
    // MARK: 친구를 추가하고 돌아왔을 때, TableView 다시 그리기
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
        var vCount = UserDefaults.standard.array(forKey: MyFriend.personInfo)?.count
        
        if vCount == nil {
            vCount = 1
        }
        
        return vCount!
    }
    
    // MARK: 셀 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        var vArrayUserInfo = UserDefaults.standard.array(forKey: MyFriend.personInfo) as? [[String : String]]
        var vDicUserData:[String:String]?
        
        if vArrayUserInfo == nil && indexPath == [0, 0] {
            vArrayUserInfo = [[MyFriend.name:"데이터가 없습니다. 친구를 추가해주세요. ☝🏻"]]
            vDicUserData = vArrayUserInfo?[0]
            cell.textLabel?.text = vDicUserData?[MyFriend.name]
        }else {
            vDicUserData = vArrayUserInfo?[indexPath.row]
            cell.textLabel?.text = vDicUserData?[MyFriend.name]
        }
        
        return cell
    }


}
