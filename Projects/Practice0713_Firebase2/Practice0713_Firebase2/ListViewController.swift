//
//  ListViewController.swift
//  Practice0713_Firebase2
//
//  Created by leejaesung on 2017. 7. 13..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableViewMain:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //rawMemoData.setValue(["\(Date())":["title":textFieldTitle.text, "memo":textFieldMemo.text]])
        
        let rawMemoData = Database.database().reference().child("memoDataOf\(UserDefaults.standard.string(forKey: userKey)!)")
        rawMemoData.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let memoData = data?["person1"] as? String ?? "(no data)"
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        myCell.textLabel?.text = "textLabel"
        myCell.detailTextLabel?.text = "detail"
        
        return myCell
        
    }
    

}
