//
//  ViewController.swift
//  Practice0612_CutomTableView
//
//  Created by leejaesung on 2017. 6. 12..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var myTableView:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell:MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyTableViewCell

        myCell.albumImage?.image = UIImage(named: "iu\(indexPath.row+1).jpg")
        myCell.albumTitle?.text = "\(indexPath.row+1)"
        
        return myCell
    }
    

}

