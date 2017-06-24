//
//  DataCenter.swift
//  Practice0620_TableViewCellForIndexPath
//
//  Created by leejaesung on 2017. 6. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

enum EnumDataCenter:String {
    case Birth
    case CPU
    case RAM
    case SSD
    case Display
    case Color
}

class DataCenter {
    
    static let sharedInstance:DataCenter = DataCenter()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let docuPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realDocuPath = docuPath[0] + "/MyAppleProduct.plist"
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: realDocuPath) {
            if let bundlePath = Bundle.main.path(forResource: "MyAppleProduct", ofType: "plist") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realDocuPath)
                } catch <#pattern#> {
                    <#statements#>
                }
                
                return
            }
        }else {
            return
        }
    }
}
