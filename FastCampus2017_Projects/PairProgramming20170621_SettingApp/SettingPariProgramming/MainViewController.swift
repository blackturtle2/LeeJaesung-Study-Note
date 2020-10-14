//
//  ViewController.swift
//  SettingPariProgramming
//
//  Created by CLEE on 21/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomSwtichCellProtocol {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.sharedInstance.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 0이면 노푸시
        guard indexPath.row != 0 else {
            return
        }
        
        //move
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.selectedMenu = indexPath.row
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let valueOfCellType = DataCenter.sharedInstance.cellTypeOf(row: indexPath.row)
        
        switch valueOfCellType {
        case .Basic:
            let myCell = tableView.dequeueReusableCell(withIdentifier: valueOfCellType.rawValue, for: indexPath)
            myCell.textLabel?.text = DataCenter.sharedInstance.nameOf(row: indexPath.row)
            return myCell
            
        case .Detail:
            let myCell = tableView.dequeueReusableCell(withIdentifier: valueOfCellType.rawValue, for: indexPath)
            myCell.textLabel?.text = DataCenter.sharedInstance.nameOf(row: indexPath.row)
            return myCell
            
        case .Swtich:
            let myCell = tableView.dequeueReusableCell(withIdentifier: valueOfCellType.rawValue, for: indexPath) as! CustomSwitchCell
            myCell.labelforSwitcher?.text = DataCenter.sharedInstance.nameOf(row: indexPath.row)
            myCell.delegateForSwitcher = self
            myCell.selectionStyle = .none
            
            return myCell
        }

    }
    
    
    
    func customSwitchCellDelegate(cell: CustomSwitchCell, isOn: Bool) {
        print("isON: \(isOn)")
    }
    
    
}

