////
////  Person.swift
////  Closure
////
////  Created by youngmin joo on 2017. 6. 26..
////





// MARK: ***** ***** [ CAUTION ] I Don't use this Class-! ***** ***** *****





//import Foundation
//
//enum Gender:Int {
//    case Man = 0, Woman, Unknown
//    
//    var returnString:String {
//        get{
//            switch self {
//            case .Man:
//                return "Man"
//            case .Woman:
//                return "Woman"
//            case .Unknown:
//                return "Unknown"
//            }
//        }
//    }
//}
//
//class Person {
//    var name:String
//    var gender:Gender
//    var age:Int?
//    
//    init(pName:String, pGender:Gender) {
//        name = pName
//        gender = pGender
//    }
//}
//
//class FriendsList {
//    
//    static let sharedInstance = FriendsList()
//    
//    var arrayFriendsList:[[String:String]]?
//    
//    init() {
//        if let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") {
//            arrayFriendsList = vArrayTotalFriends as? [[String:String]]
//        }else {
//            arrayFriendsList = []
//        }
//        
//    }
//    
//    func saveFriend(person p:Person) {
//        let strAge = String(p.age!)
//        let strGender = String(p.gender.returnString)
//        
//        guard var vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") else {
//            UserDefaults.standard.set([["Name": p.name, "Age": strAge, "Gender": strGender]], forKey: "friends")
//            return
//        }
//        
//        vArrayTotalFriends.append(["Name": p.name, "Age": strAge, "Gender": strGender])
//        UserDefaults.standard.set(vArrayTotalFriends, forKey: "friends")
//        
//        return
//    }
//    
//    func getFriendNameOf(index i:Int) -> String {
//        let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") as! [[String:String]]
//        
//        return vArrayTotalFriends[i]["Name"]!
//    }
//    
//    
//}
//
