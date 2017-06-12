//
//  MyString.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

struct StringLogin {
    static let user = "user" //string // user = [[email:String, password:String, name:String]]
    static let id = "id" //string
    static let password = "password" //string
    static let name = "name" //string

    static let isLogin = "isLogin" //bool
    
    static let currentUserID = "currentUserID" //String - 로그인한 user의 ID 저장.
}

struct MyMemo {
    static let memo = "memo" // 일단, 메모 앱을 구현한다.
    static let memoUser = "memoUserFor" // 뒤에 로그인한 User의 KeyID를 붙인다.
    
    static let memoTitle = "memoTitle"
    static let memoContent = "memoContent"
    
    static func memoKey(id:String) -> String {
        return "memo_\(id)"
    }
}
