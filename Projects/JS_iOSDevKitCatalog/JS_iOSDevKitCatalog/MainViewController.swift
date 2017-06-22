//
//  ViewController.swift
//  JS_iOSDevKitCatalog
//
//  Created by leejaesung on 2017. 6. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "MoveCaculationViewController", sender: nil)
        case 1:
            performSegue(withIdentifier: "MovePocketmonViewController", sender: nil)
        default: break
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            myCell.textLabel?.text = "Cacluation"
            myCell.detailTextLabel?.text = "Practice0510"
        case 1:
            myCell.textLabel?.text = "Pocketmon"
            myCell.detailTextLabel?.text = "Practice0517"
        default: break
            
        }
        
        return myCell
    }


}

