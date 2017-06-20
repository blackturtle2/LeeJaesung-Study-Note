//
//  SettingViewController.swift
//  Practice0620_BrandNewSettingApp
//
//  Created by leejaesung on 2017. 6. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {
    
    
    // MARK: ********** Life Cycle **********
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: ********** UITableViewDataSource **********
    func numberOfSections(in tableView: UITableView) -> Int {
        return (SettingCenter.sharedSetting.settingMenuDataList?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedSetting.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedSetting.titleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = SettingCenter.sharedSetting.typeOfCellFor(rowAtIndexPath: indexPath)
        
        
        switch cellType {
        case .Basic:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Basic.rawValue)!
            
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            myCell.detailTextLabel?.text = "hihihi"
            myCell.selectionStyle = .none
            
            return myCell
        case .Detail:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Detail.rawValue)!
            
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            
            return myCell
        case .Switch:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Switch.rawValue) as! SettingSwitchCell
            
            myCell.labelTitle?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            myCell.delegate = self
            
            return myCell
            
        case .BlueButton:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.BlueButton.rawValue, for: indexPath)
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            return myCell
            
        case .RedButton:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.RedButton.rawValue, for: indexPath)
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            return myCell
        }
        
    }
    
    // MARK: ********** SettingSwitchCellDelegate **********
    func cellValueChanged(_ cell: SettingSwitchCell, isOn: Bool) {
        print("cellValueChanged")
    }
    
}
