//
//  SettingCenter.swift
//  Practice0620_BrandNewSettingApp
//
//  Created by leejaesung on 2017. 6. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

enum SettingCellType:String {
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
    case BlueButton = "SettingBlueButtonCell"
    case RedButton = "SettingRedButtonCell"
}

class SettingCenter {
    
    // Singleton.
    static let sharedSetting:SettingCenter = SettingCenter()
    
    var settingMenuDataList:[Any]?
    
    // section의 갯수 리턴.
    var sectionCount:Int {
        return settingMenuDataList?.count ?? 0
    }
    
    // section별 Row 갯수 리턴.
    func numberOfRows(in section:Int) -> Int {
        guard let sectionData = settingMenuDataList else {  return 1 }
        
        let dicSectionData:[String:Any] = sectionData[section] as! [String:Any]
        let arrayRowTitle = dicSectionData["Data"] as! [[String:String]]
        
        return arrayRowTitle.count
    }
    
    // section의 title 리턴.
    func titleFor(section:Int) -> String {
        guard let sectionData = settingMenuDataList else {  return "" }
        
        let dicSectionData:[String:Any] = sectionData[section] as! [String : Any]
        let sectionTitle = dicSectionData["SectionTitle"] as? String
        
        return sectionTitle ?? "섹션 이름 없음"
    }
    
    // row의 title 리턴.
    func titleFor(rowAtIndexPath indexPath:IndexPath) -> String {
        guard let sectionData = settingMenuDataList else {  return "" }
        
        let dicSectionData:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let arrayRowTitle = dicSectionData["Data"] as! [[String:String]]
        let rowTitle = arrayRowTitle[indexPath.row]["Content"]!
        
        return rowTitle
    }
    
    // 각 셀의 타입 가져오기.
    func typeOfCellFor(rowAtIndexPath indexPath:IndexPath) -> SettingCellType {
        guard let sectionData = settingMenuDataList else { return .Basic }
        
        let dicSectionData:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let arrayCellStyle = dicSectionData["Data"] as! [[String:String]]
        let cellStyle = arrayCellStyle[indexPath.row]["CellStyle"]
        
        return SettingCellType(rawValue: cellStyle!) ?? .Basic
    }
    
    // init()
    private init() {
        loadSettingData()
    }
    
    // Settings.plist 에서 데이터를 불러오기.
    func loadSettingData() {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] {
            
            self.settingMenuDataList = settingMenuDataList
        }
        
    }
    
    
}
