//
//  DataCenter.swift
//  Practice0703_CollectionView
//
//  Created by leejaesung on 2017. 7. 3..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class DataCenter {
    static let center = DataCenter()
    
    var friendList = ["A", "B", "C", "D", "E"]
    
    func insertItems(at item:[IndexPath]) {
        let data:[String] = DataCenter.center.friendList
        
        for indexpath in item {
            friendList.insert(data[indexpath.item], at: 0)
        }
        
//        let tempList:[String] = item.map { (indexPath) -> String in
//            friendList[indexPath.item]
//        }
//        friendList += tempList
    }
    
    
}
