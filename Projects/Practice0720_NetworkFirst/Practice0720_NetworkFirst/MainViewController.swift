//
//  ViewController.swift
//  Practice0720_NetworkFirst
//
//  Created by leejaesung on 2017. 7. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableViewMain:UITableView!
    
    var data = NSMutableArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUserData()
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    func reloadData() {
        let url = URL(string: "http://localhost:1337/user")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let data = data else { return print("Guard let- data") }
            
//            let dataStr = String.init(data: data, encoding: .utf8)
//            print("dataStr: \(String(describing: dataStr))")
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
                print("json: \(json)")
                
                self.data = json as! NSMutableArray
                
                DispatchQueue.main.async {
                    self.tableViewMain.reloadData()
                }
                
                for item in json {
                    let test = item as! NSDictionary
                    
                    print(test["email"]!)
                }
                
            }
            
            //            print("response: \(response!)")
            //            print("error: \(String(describing: error))")
        }
        
        task.resume()
        
        //        print("task: \(task)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let pair = self.data.object(at: indexPath.row) as! NSDictionary
        
        myCell.textLabel?.text = pair["email"] as? String
        myCell.detailTextLabel?.text = pair["password"] as? String
        
        return myCell
    }
    
    @IBAction func refreshButtonAction(_ sender:UIButton) {
//        self.tableViewMain.reloadData()
        print("reload!")
        reloadData()
    }
    
    
    
    func fetchUserData() {
        Alamofire.request("http://localhost:1337/user").responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                print("Alamofire: \(value)")
            case .failure(let error):
                print("Alamofire: \(error)")
            }
            
        }
    }
    
}
