//
//  SecondViewController.swift
//  SettingPariProgramming
//
//  Created by CLEE on 21/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedMenu:Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("MainView's indexPath.row: \(selectedMenu)")
        
        self.title = setTitle()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let id:CellId = switchIdOf()
        
        return DeepDataCenter.sharedInstance.numberOfRow(id: id)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let id:CellId = switchIdOf()
        
        return DeepDataCenter.sharedInstance.sectionNameOf(id: id, section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id:CellId = switchIdOf()
        let valueOfCellType = DeepDataCenter.sharedInstance.cellTypeOf(id: id, row: indexPath.row)
        
        switch valueOfCellType {
        case .Basic:
            let myCell = tableView.dequeueReusableCell(withIdentifier: valueOfCellType.rawValue, for: indexPath)
            myCell.textLabel?.text = DeepDataCenter.sharedInstance.nameOf(id: id, row: indexPath.row)
            return myCell
            
        case .Detail:
            let myCell = tableView.dequeueReusableCell(withIdentifier: valueOfCellType.rawValue, for: indexPath)
            myCell.textLabel?.text = DeepDataCenter.sharedInstance.nameOf(id: id, row: indexPath.row)
            return myCell
            
        case .Swtich:
            let myCell = tableView.dequeueReusableCell(withIdentifier: valueOfCellType.rawValue, for: indexPath) as! CustomSwitchCell
            myCell.labelforSwitcher?.text = DeepDataCenter.sharedInstance.nameOf(id: id, row: indexPath.row)
//            myCell.delegateForSwitcher = self
            myCell.selectionStyle = .none
            
            return myCell
        }
    }
    
    
    // MARK: ********** JS's function **********
    func switchIdOf() -> CellId {
        
        switch selectedMenu {
        case 1:
            return CellId.Wifi
        case 2:
            return CellId.Bluetooth
        case 3:
            return CellId.Cellular
        case 4:
            return CellId.Hotspot
        case 5:
            return CellId.Network
        default:
            return CellId.Wifi
        }
    }
    
    func setTitle() -> String {
        let id:CellId = switchIdOf()
        
        switch id {
        case .Wifi:
            return "Wi-Fi"
        case .Bluetooth:
            return "Bluetooth"
        case .Cellular:
            return "셀룰러"
        case .Hotspot:
            return "개인용 핫스팟"
        case .Network:
            return "네트워크 사업자"
        }
    }
    
    
}
