//
//  ViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var vArrayUserInfo:[[String:String]]?
    var valueUserData:[String:String]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        
        vArrayUserInfo = UserDefaults.standard.array(forKey: LoginInfo.userInfo) as? [[String : String]]
        
        if vArrayUserInfo == nil {
            vArrayUserInfo = [[LoginInfo.name:"Data is Nil"]]
            valueUserData = vArrayUserInfo?[0]
        }
        
        cell.textLabel?.text = value(forKey: valueUserData![LoginInfo.name]!) as! String
        
        return cell
    }


}

