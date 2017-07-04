//
//  DataFile.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//

import Foundation

let userDefaultsForKey:String = "dicFriends"


// MARK: *** FriendList를 단순 Array로 만들었을 때의 Struct ***
//struct FriendList {
//    var arrFriendList:[Friend] = []
//    
//    init(Data:[[String:Any]]) {
//        for item:[String:Any] in Data {
//            arrFriendList.append(Friend(data: item))
//        }
//    }
//}

// MARK: *** struct FriendList ***
struct FriendList {
    var dicFriendList:[String:Friend] = [:] // [pk:Friend]; pk는 Date()로 저장.
    
    init(Data:[String:[String:Any]]) {
        for item in Data {
            dicFriendList.updateValue(Friend(data: item.value), forKey: item.key)
        }
    }
}

// MARK: *** struct Friend ***
struct Friend {
    var name:String
    var gender:String
    var age:Int?
    
    init(data:[String:Any]) {
        name = data["friend_name"] as? String ?? "(이름 없음)"
        gender = data["friend_gender"] as? String ?? "(성별 없음)"
    }
    
    init(name aName:String, gender aGender:String) {
        self.name = aName
        self.gender = aGender
    }
    
    var dic:[String:Any] {
        var dicResult:[String:Any] = [:]
        dicResult.updateValue(name, forKey: "friend_name")
        dicResult.updateValue(gender, forKey: "friend_gender")
        dicResult.updateValue(age ?? 0, forKey: "friend_age")
        
        return dicResult
    }
}


class DataCenter {
    
    static let sharedInstance:DataCenter = DataCenter()
    
//    var arrFriendListData:FriendList?
    var dicFriendListData:FriendList?
    
    init() {
        loadData()
    }
    
// MARK: *** loadData(): Singleton에 UserDefaults로부터 Array를 통째로 받아서 넣는 function ***
//    func loadData() {
//        guard let arrData = UserDefaults.standard.array(forKey: "friends") else {
//            print("ERROR- loadData_guard_let")
//            return
//        }
//        
//        self.arrFriendListData = FriendList(Data: arrData as! [[String : Any]])
//    }

    // MARK: *** loadData() ***
    // Array에서 PK가 있는 Dictionary로 전환하면서 function 재설계.
    func loadData() {
        guard let dicData = UserDefaults.standard.dictionary(forKey: userDefaultsForKey) else {
            print("ERROR- loadData_guard_let")
            return
        }
        
        self.dicFriendListData = FriendList(Data: dicData as! [String : [String : Any]])
    }
    
// MARK: *** saveDataOf(): Friend 객체를 받아서 UserDefaults에 저장하는 function ***
//    func saveDataOf(friend aFriend:Friend) {
//        guard var arrData = UserDefaults.standard.array(forKey: "friends") else {
//            UserDefaults.standard.set([aFriend.dic], forKey: "friends")
//            print("ERROR- saveDataOf_guard_let")
//            return
//        }
//        
//        arrData.append(aFriend.dic)
//        
//        UserDefaults.standard.set(arrData, forKey: "friends")
//        print("Success- UserDefaults_set")
//    }
    
    // MARK: *** saveDataOf() ***
    // Array에서 PK가 있는 Dictionary로 전환하면서 function 재설계.
    func saveDataOf(friend aFriend:Friend) {
        guard var dicData = UserDefaults.standard.dictionary(forKey: userDefaultsForKey) else {
            UserDefaults.standard.set(["\(Date())":aFriend.dic], forKey: userDefaultsForKey)
            loadData() // Singleton 인스턴스에도 값이 저장되도록 한다.
            print("ERROR- saveDataOf_guard_let")
            return
        }
        
        dicData["\(Date())"] = aFriend.dic
        
        UserDefaults.standard.set(dicData, forKey: userDefaultsForKey)
        loadData() // Singleton 인스턴스에도 값이 저장되도록 한다.
        
        print("Success- UserDefaults_set")
    }
    
    // MARK: lineUpDicDataOfFriend(): Key값에 따라서 FriendList Dictionary를 정렬합니다.
    func loadLineUpDicFriendList() -> [String:Friend] {
        let sortedData = dicFriendListData?.dicFriendList.sorted(by: { $0.0 < $1.0 })
        
        let sortData = dicFriendListData?.dicFriendList.sorted(by: { (item1:(key: String, value: Friend), item2:(key: String, value: Friend)) -> Bool in
            
        })
        
        return sortedData
    }
    
}
