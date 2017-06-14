//
//  ShowAlert.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 14..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation
import UIKit

enum AlertType {
    case loginFail
    case loginSuccess
}

// JsToolBox 만들다가 말았음. 20170614
class JsToolBox {
    
    func showAlert(type: AlertType, sender: UIViewController) {
        let alert = UIAlertController(title: titleMsg(for: type), message: titleMsg(for: type), preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        
        sender.present(alert, animated: true, completion: nil)
    }
    
    func titleMsg(for type:AlertType) -> String {
        var result:String?
        
        switch type {
        case .loginFail:
            result = "로그인이 실패하였습니다."
        case .loginSuccess:
            result = "로그인 성공"
        }
        
        return result!
    }
    
    
}
