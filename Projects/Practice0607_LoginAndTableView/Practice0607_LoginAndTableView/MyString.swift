//
//  MyString.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

struct StringLogin {
    static let email = "email" //string
    static let name = "name" //string
    static let password = "password" //string
    static let isLogin = "isLogin" //bool
    static let totalUserKeyID = "totalUserKeyID" //int
    static let currentUserKeyID = "currentUserKeyID" //int - 로그인한 USER의 ID 값 저장.
    
}

struct MyFriend {
    static let personInfo = "userInfo"
    static let name = "name"
    static let id = "id"
}

struct MyMemo {
    static let memo = "memo" // 일단, 메모 앱을 구현한다.
    static let memoUser = "memoUserFor" // 뒤에 로그인한 User의 KeyID를 붙인다.
    
    static let memoTitle = "memoTitle"
    static let memoContent = "memoContent"
}
