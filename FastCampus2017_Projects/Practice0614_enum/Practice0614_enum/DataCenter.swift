//
//  DataCenter.swift
//  Practice0614_enum
//
//  Created by leejaesung on 2017. 6. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class DataCenter {
    
    static let sharedInstance = DataCenter()
    
    func addUser(userData:[String:Any]) {
        
        UserDefaults.standard.set(userData, forKey: "user")
    }
    
    func loadUser(userData:[String:Any]) -> [String:Any] {
        return UserDefaults.standard.dictionary(forKey: "user")!
    }
}
