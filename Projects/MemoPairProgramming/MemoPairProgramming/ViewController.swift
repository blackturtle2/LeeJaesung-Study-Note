//
//  ViewController.swift
//  MemoPairProgramming
//
//  Created by leejaesung on 2017. 6. 8..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tv: UITableView!
    var vIndexPath:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tv.reloadData()
    }
    
    // Row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vArrayMemoData = UserDefaults.standard.array(forKey: Need.memo) as? [[String:String]]
        
        if vArrayMemoData == nil {
            return 1
        }
        
        return (vArrayMemoData?.count)!
    }
    
    // cell 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        let title = UserDefaults.standard.array(forKey: Need.title) as! [String:Any]
//        cell.textLabel?.text = title[Need.title] as! String
        
        var vArrayMemoData = UserDefaults.standard.array(forKey: Need.memo) as? [[String:String]]
        let vDicMemoData:[String:String]?
        
        if vArrayMemoData == nil && indexPath.row == 0 {
//            vArrayMemoData = [[Need.title:"No Data"]]
            vDicMemoData = [Need.title:"No Data"]
        }else {
            vDicMemoData = vArrayMemoData?[indexPath.row]
        }
        
        cell.textLabel?.text = vDicMemoData?[Need.title]
        
        return cell
    }

//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        vIndexPath = indexPath.row
//        
//        
//        performSegue(withIdentifier: "edit", sender: nil)
//        
//        return indexPath
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vIndexPath = indexPath.row
        
        
        performSegue(withIdentifier: "edit", sender: nil)
    }
    
    
    // add 버튼 구현
    @IBAction func TouchedbutAdd(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "add", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        
        if segue.identifier == "edit"{
            var vArrayMemoData = UserDefaults.standard.array(forKey: Need.memo) as! [[String:String]]
            let vTitle = vArrayMemoData[vIndexPath!]
            let vContents = vArrayMemoData[vIndexPath!]
            detailViewController.vTitle = vTitle[Need.title]!
            detailViewController.vContents = vContents[Need.contents]!
            detailViewController.isEditingMode = true
            detailViewController.dInt = vIndexPath
            
        }

    }
}

