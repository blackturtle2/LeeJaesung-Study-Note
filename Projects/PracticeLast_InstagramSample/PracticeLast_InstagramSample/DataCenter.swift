//
//  DataCenter.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 26..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation
import Firebase

class DataCenter {
    static let sharedData = DataCenter()
    
    var isLogin:Bool = false
    var userData:User?
    
    
    func requestLogin() -> Bool {
        if Auth.auth().currentUser == nil {
            isLogin = false
            return false
        } else {
            isLogin = true
            return true
        }
    }
    
    func requestUserData(completion: @escaping (_ info:User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            print("///// snapshot.value: ", snapshot.value ?? "")
            let dic = snapshot.value as! [String:Any]
//            self.userData = User(data: dic)
            
            completion(User(data:dic))
            
        }, withCancel: { (error) in
            print("///// error: ", error)
        })
    }
}

struct User {
    var userName:String?
    var userProfileImgUrl:String?
    var email:String?
    
    init(data:[String:Any]) {
        userName = data["UserName"] as? String
        userProfileImgUrl = data["ProfilePhotoUrl"] as? String
    }
    
}
