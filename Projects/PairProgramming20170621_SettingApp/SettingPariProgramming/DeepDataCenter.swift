//
//  DeepDataCenter.swift
//  SettingPariProgramming
//
//  Created by CLEE on 21/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

enum CellId:String {
    case Wifi
    case Bluetooth
    case Hotspot
    case Network
    case Cellular
}

class DeepDataCenter {
    
    static var sharedInstance:DeepDataCenter = DeepDataCenter()
    
    var saveAtSignal:[Any]?
    var saveAtCellular:[Any]?
    
    private init() {
        loadData()
    }
    
    func numberOfRow(id:CellId) -> Int {
        switch id {
        case .Wifi:
            let dicData = saveAtSignal?[0] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            
            return arrayDicData.count
        case .Bluetooth:
            let dicData = saveAtSignal?[1] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            
            return arrayDicData.count
        case .Hotspot:
            let dicData = saveAtSignal?[2] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            
            return arrayDicData.count
        case .Network:
            let dicData = saveAtSignal?[3] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            
            return arrayDicData.count
            
        case .Cellular:
            return (saveAtCellular?.count)!
        }
    }
    
    func sectionNameOf(id:CellId, section:Int) -> String {
        switch id {
        case .Wifi:
            let dicData = saveAtSignal?[0] as! [String:Any]

            return dicData["SectionTitle"] as! String
        case .Bluetooth:
            let dicData = saveAtSignal?[1] as! [String:Any]
            
            return dicData["SectionTitle"] as! String
        case .Hotspot:
            let dicData = saveAtSignal?[2] as! [String:Any]
            
            return dicData["SectionTitle"] as! String
        case .Network:
            let dicData = saveAtSignal?[3] as! [String:Any]
            
            return dicData["SectionTitle"] as! String
            
        case .Cellular:
            return "test"
        }
    }

    func nameOf(id:CellId, row:Int) -> String {
        switch id {
        case .Wifi:
            let dicData = saveAtSignal?[0] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return dicArrayDicData["Name"]!
        case .Bluetooth:
            let dicData = saveAtSignal?[1] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return dicArrayDicData["Name"]!
        case .Hotspot:
            let dicData = saveAtSignal?[2] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return dicArrayDicData["Name"]!
        case .Network:
            let dicData = saveAtSignal?[3] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return dicArrayDicData["Name"]!
            
        case .Cellular:
            return "test"
        }

    }
    
    func cellTypeOf(id:CellId, row:Int) -> CellType {
        switch id {
        case .Wifi:
            let dicData = saveAtSignal?[0] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return CellType(rawValue: dicArrayDicData["CellType"]!)!
        case .Bluetooth:
            let dicData = saveAtSignal?[1] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return CellType(rawValue: dicArrayDicData["CellType"]!)!
        case .Hotspot:
            let dicData = saveAtSignal?[2] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return CellType(rawValue: dicArrayDicData["CellType"]!)!
        case .Network:
            let dicData = saveAtSignal?[3] as! [String:Any]
            let arrayDicData = dicData["Data"] as! [Any]
            let dicArrayDicData = arrayDicData[row] as! [String:String]
            
            return CellType(rawValue: dicArrayDicData["CellType"]!)!
            
        case .Cellular:
            return CellType(rawValue: "SwitchCell")!
        }
    }
    
    func loadData() {

        if let path = Bundle.main.path(forResource: "Signal", ofType: "plist"),
        let saveAtSignal = NSArray(contentsOfFile: path) as? [Any] {
            
            self.saveAtSignal = saveAtSignal
        }
        
        if let path = Bundle.main.path(forResource: "Cellular", ofType: "plist"),
            let saveAtCellular = NSArray(contentsOfFile: path) as? [Any] {
            
            self.saveAtCellular = saveAtCellular
        }
    }
    
    
    
    
}
