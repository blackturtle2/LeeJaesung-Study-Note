//
//  FindUserAccount.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class FindUserAccount: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 취소 버튼 액션 정의
    @IBAction func buttonCancel(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
