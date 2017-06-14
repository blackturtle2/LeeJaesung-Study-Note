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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let today = Date()
//        let strToday:String = String(describing: today)
//        print("strToday: \(strToday)")
        
        // 날짜 도출하기
        let format = DateFormatter()
//        format.dateFormat = "dd.MM.yy" //14.06.17
//        format.dateFormat = "MMMMd" //June14
        format.dateFormat = "MMMM" //June
//        format.dateFormat = "MMM" //Jun
//        format.dateFormat = "MM" //06
//        format.dateFormat = "d" //14

        let result = format.string(from: Date())
        print("result: \(result)")
        
//        let dateFormat
//        
//        let todayDate =
        
        
//        let firstSpaceStrToday = strToday.characters.index(of: "-")
//        let firstStrToday = String(strToday.characters.prefix(upTo: firstSpaceStrToday!))
//        print("firstStrToday: \(firstStrToday)")
        
        // 자동으로 스크롤
        mainTableView?.scrollToRow(at: IndexPath(row: 19, section: 5), at: .top, animated: true)
        
        // 텍스트뷰 선택되도록 하다가 실패
//        mainTableView?.cellForRow(at: IndexPath(row: 19, section: 5)).textViewContents.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

