//
//  StaticData.swift
//  Practice0619_plist
//
//  Created by leejaesung on 2017. 6. 19..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class StaticData {
    private static let instance:StaticData = StaticData()
    
    class var sharedInstance: StaticData {
        
        return instance
    }
//    
//    func init() {
//        load()
//    }
//    
//    func deinit() {
//        save()
//    }
//    
//    func load() -> StaticData {
//        let docuPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        let realDocPath = docuPath[0] + "/TestData.plist"
//        let fileManager = FileManager.default
//        
//        if fileManager.fileExists(atPath: realDocPath) {
//            print("YES: fileManager.fileExists(atPath: realDocPath)")
//            return
//        }else {
//            if let bundlePath = Bundle.main.path(forResource: "TestData", ofType: "plist") {
//                do {
//                    try fileManager.copyItem(atPath: bundlePath, toPath: realDocPath)
//                } catch  {
//                    return
//                }
//            }
//        }
//    }
//    
//    func save() {
//        
//    }
    
}
