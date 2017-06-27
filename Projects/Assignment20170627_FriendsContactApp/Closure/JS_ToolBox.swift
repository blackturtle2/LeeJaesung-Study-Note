//
//  JS_ToolBox.swift
//  FriendList
//
//  Created by leejaesung on 2017. 6. 27..
//  Copyright © 2017년 ITPARTY. All rights reserved.
//

import UIKit

class JS_ToolBox {
    
    static func showOkAlert(sender pSender: UIViewController, title pTitle:String, massage pMassage:String, handler pHandler:((_ action:UIAlertAction) -> Void)?) {
        let vAlertController = UIAlertController(title: pTitle, message: pMassage, preferredStyle: .alert)
        let vAlertAction = UIAlertAction(title: "확인", style: .default, handler: pHandler)
        
        vAlertController.addAction(vAlertAction)
        
        pSender.present(vAlertController, animated: true, completion: nil)
    }
}
