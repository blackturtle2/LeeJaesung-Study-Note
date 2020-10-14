//
//  ViewController.swift
//  Practice0616_CustomCell_TextField
//
//  Created by leejaesung on 2017. 6. 16..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProtocolCustomCell {
    
    @IBOutlet var mainTableView:UITableView?
    @IBOutlet var mainStepper:UIStepper?
    
    var rowCount:Int = 1 // 테이블 뷰의 row 갯수
    var dicUser:[IndexPath:String] = [:]
    var lastCellIndexPath:IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Stepper 버튼 액션에 따른 mainTableView row 갯수 조절.
    @IBAction func stepperAction(_ sender:UIStepper) {
        
        // Stepper에서 마이너스를 눌렀을 때, 데이터도 함께 지우기.
        if rowCount > Int(sender.value) {
            dicUser.removeValue(forKey: lastCellIndexPath!)
            print(dicUser)
        }
        
        rowCount = Int(sender.value)
        mainTableView?.reloadData()
        
    }
    
    // 테이블 뷰의 섹션은 1개. 변하지 않음.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 테이블 뷰의 row 갯수 리턴.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    // 테이블 뷰의 cell 그리기.
    // cell을 하나씩 그릴 때마다 Delegate 연결한다. --> 핵포인트.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomTableViewCell
        
        myCell.cellDelegate = self // Cell의 delegate는 ViewController와 연결하기.
        lastCellIndexPath = indexPath // 마지막 Cell의 indexpath를 저장하는 용도.
        
        return myCell
    }
    
    // ProtocolCustomCell로부터 넘어온 function.
    // Custom Cell이 자기 자신을 item으로 리턴한다. IndexPath를 처리하기 위해 사용한다.
    func returnCustomCellSelf(item: CustomTableViewCell) {
        
        if let myIndexPath:IndexPath = mainTableView?.indexPath(for: item) {
            print("myIndexPath: \(myIndexPath)")
        }else {
            print("error-")
        }
        
    }
    
    // Cell의 Return 버튼을 눌렀을 때, 데이터를 저장하는 액션.
    // TextField의 EndEditing도 같은 액션이므로 여기에 연결. ( 함수 이름은 굳이 바꾸지 않는 걸로.. )
    func customCellTextFieldShouldReturn(item: CustomTableViewCell) {
        let myIndexPath:IndexPath = (mainTableView?.indexPath(for: item))!
        
        if dicUser[myIndexPath] == nil {
            dicUser[myIndexPath] = (item.textViewUserName?.text)!
        }else {
            dicUser.updateValue((item.textViewUserName?.text)!, forKey: myIndexPath)
        }
        print(dicUser)
    }
}

