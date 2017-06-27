//
//  DataCenter.swift
//  Practice0627_StudyDataModeling
//
//  Created by leejaesung on 2017. 6. 27..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class DataCenter {
    
    static let sharedInstance:DataCenter = DataCenter()
    
    var personList:[Person] = []
    
    
    init() {
//        let vPerson = Person(name: "leejaesung", age: 30)
//        personList = [vPerson]
        
        loadData()
        
    }
    
    func loadData() {
        guard let vArrayPersonList = UserDefaults.standard.array(forKey: "people") else { return print("guard-let") }
        
        personList = vArrayPersonList as! [Person]
    }
    
    
}
