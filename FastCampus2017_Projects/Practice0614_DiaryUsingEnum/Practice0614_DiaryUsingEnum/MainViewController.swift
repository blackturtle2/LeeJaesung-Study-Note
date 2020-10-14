//
//  ViewController.swift
//  Practice0614_DiaryUsingEnum
//
//  Created by leejaesung on 2017. 6. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mainTableView:UITableView?
    
    var vDataCenter:DataCenter = DataCenter()
    let customCell:CustomTableViewCell = CustomTableViewCell()
    var todayMonth:Int?
    var todayDate:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 날짜 도출하기
        let formatMonth = DateFormatter()
        formatMonth.dateFormat = "M" //6
        let formatDate = DateFormatter()
        formatDate.dateFormat = "d"
        
        todayMonth = Int(formatMonth.string(from: Date()))!
        todayDate = Int(formatDate.string(from: Date()))!
        print("todayMonth: \(todayMonth!) / todayDate: \(todayDate!)") // 검사
        
    }

    override func viewWillAppear(_ animated: Bool) {
        mainTableView?.scrollToRow(at: IndexPath(row: todayDate!-1, section: todayMonth!-1), at: .top, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 자동 FirstResponder 시도중..
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let myCell = cell as! CustomTableViewCell
        myCell.textViewContents?.becomeFirstResponder()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vDate:Int = vDataCenter.findDate(of: vDataCenter.findMonth(of: section + 1))
        
        return vDate
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let vStrMonth:String = vDataCenter.findMonth(of: section + 1).rawValue
        
        return vStrMonth
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell")! as! CustomTableViewCell
        
        myCell.labelDate?.text = String(indexPath.row + 1)
        
        
        return myCell
    }
    
}

