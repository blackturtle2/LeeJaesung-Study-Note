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
        
    }
}
