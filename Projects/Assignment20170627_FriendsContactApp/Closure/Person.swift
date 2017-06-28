//
//  Person.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 26..
//

import Foundation

enum Gender:Int {
    case Man = 0, Woman, Unknown
    
    var returnString:String {
        get{
            switch self {
            case .Man:
                return "Man"
            case .Woman:
                return "Woman"
            case .Unknown:
                return "Unknown"
            }
        }
    }
}

class Person {
    var name:String
    var gender:Gender
    var age:Int?
    
    init(pName:String, pGender:Gender) {
        name = pName
        gender = pGender
    }
}

class FriendsList {
    
    static var sharedInstance = FriendsList()
    
    var arrayFriendsList:[Person] = []
    
    func saveFriend(person p:Person) {
        let strAge = String(p.age!)
        let strGender = String(p.gender.returnString)
        
        guard var vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") else {
            UserDefaults.standard.set([["Name": p.name, "Age": strAge, "Gender": strGender]], forKey: "friends")
            return
        }
        
        vArrayTotalFriends.append(["Name": p.name, "Age": strAge, "Gender": strGender])
        UserDefaults.standard.set(vArrayTotalFriends, forKey: "friends")
        
        return
    }
    
    func getFriendNameOf(index i:Int) -> String {
        let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") as! [[String:String]]
        
        return vArrayTotalFriends[i]["Name"]!
    }
//
//    func getFriendAge(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
//    
//    func getFriendGender(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
    
}

