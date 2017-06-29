//
//  DataFile.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//

import Foundation


struct FriendList {
    var arrFriendList:[Friend] = []
    
    init(Data:[[String:Any]]) {
        for item:[String:Any] in Data {
            arrFriendList.append(Friend(data: item))
        }
    }
}

struct Friend {
    var pk:Int
    var name:String
    var gender:String
    var age:Int?
    
    init(data:[String:Any]) {
        pk = data["friend_pk"] as! Int
        name = data["friend_name"] as? String ?? "(이름 없음)"
        gender = data["friend_gender"] as? String ?? "(성별 없음)"
    }
    
    init(primaryKey pk:Int, name aName:String, gender aGender:String) {
        self.pk = pk
        self.name = aName
        self.gender = aGender
    }
    
    var dic:[String:Any] {
        var dicResult:[String:Any] = [:]
        dicResult.updateValue(pk, forKey: "friend_pk")
        dicResult.updateValue(name, forKey: "friend_name")
        dicResult.updateValue(gender, forKey: "friend_gender")
        dicResult.updateValue(age ?? 0, forKey: "friend_age")
        
        return dicResult
    }
}

class DataCenter {
    
    static let sharedInstance:DataCenter = DataCenter()
    
    var arrFriendListData:FriendList?
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let arrData = UserDefaults.standard.array(forKey: "friends") else {
            print("ERROR- loadData_guard_let")
            return
        }
        
        self.arrFriendListData = FriendList(Data: arrData as! [[String : Any]])
    }
    
    func saveDataOf(friend aFriend:Friend) {
        guard var arrData = UserDefaults.standard.array(forKey: "friends") else {
            UserDefaults.standard.set([aFriend.dic], forKey: "friends")
            print("ERROR- saveDataOf_guard_let")
            return
        }
        
        arrData.append(aFriend.dic)
        
        UserDefaults.standard.set(arrData, forKey: "friends")
        print("Success- UserDefaults_set")
    }
}
