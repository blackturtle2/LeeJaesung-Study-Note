//
//  DataCenter.swift
//  Practice0703_MyUICollectionView
//
//  Created by leejaesung on 2017. 7. 3..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class DataCenter {
    
    static let center = DataCenter()
    
    var originalData:[String] = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
    
    
    func nameOf(indexItem i:Int) -> String {
        return originalData[i]
    }
    
}
