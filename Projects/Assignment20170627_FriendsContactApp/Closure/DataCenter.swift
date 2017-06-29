//
//  DataFile.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//

import Foundation


class FriendList {
    var arrayFriendList:[Friend] = []
    
    init(pData:[[String:Any]]) {
        for i:[String:Any] in pData {
            arrayFriendList.append(Friend(data: i))
        }
    }
    
}

class Friend {
    var name:String
    var gender:String
    var age:String?
    
    init(data:[String:Any]) {
        name = data["name"] as? String ?? "(이름 없음)"
        gender = data["gender"] as? String ?? "(성별 없음)"
    }
    
}

class DataCenter {
    
    static let sharedInstance:DataCenter = DataCenter()
    var arrayFriendList:FriendList?
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let vArrayData = UserDefaults.standard.array(forKey: "friends") {
            arrayFriendList = FriendList(pData: vArrayData as! [[String : Any]])
        }else {
            print("ERROR- ")
        }
    }
    
}

func saveFriendOf(person pData:Friend) {
    guard var vArrayTotalFriendList = UserDefaults.standard.array(forKey: "friends") else {
        UserDefaults.standard.set([["Name": pData.name, "Age": pData.age, "Gender": pData.gender]], forKey: "friends")
        return
    }
    
    vArrayTotalFriendList.append(["Name": pData.name, "Age": pData.age, "Gender": pData.gender])
    
    UserDefaults.standard.set(vArrayTotalFriendList, forKey: "friends")
}
