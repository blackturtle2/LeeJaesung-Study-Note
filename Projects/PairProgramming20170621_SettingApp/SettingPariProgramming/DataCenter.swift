//
//  DataCenter.swift
//  SettingPariProgramming
//
//  Created by CLEE on 21/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

enum CellType:String {
    case Basic = "BasicCell"
    case Detail = "DetailCell"
    case Swtich = "SwitchCell"
}

class DataCenter {
    
    static var sharedInstance:DataCenter = DataCenter()
    
    var settingMenuDatalist:[Any]?
    
    private init() {
        loadData()
    }
    
    func numberOfRow() -> Int {
        return 6
    }
    
    func nameOf(row:Int) -> String {
        let dicData = settingMenuDatalist?[row] as! [String:String]
        
        return dicData["Name"]!
    }
    
    func cellTypeOf(row:Int) -> CellType {
        let dicData = settingMenuDatalist?[row] as! [String:String]
        return CellType(rawValue: dicData["CellType"]!)!
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "Main", ofType: "plist"),
            let settingMenuDatalist = NSArray(contentsOfFile: path) as? [Any] {
            
            self.settingMenuDatalist = settingMenuDatalist
        }
    }
}
