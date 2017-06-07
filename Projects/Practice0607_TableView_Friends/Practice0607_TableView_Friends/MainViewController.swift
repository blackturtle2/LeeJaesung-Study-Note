//
//  ViewController.swift
//  Practice0607_TableView_Friends
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    let myAnimal = AnimalName()
    var customAnimal:Array<String> = []
    var data:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.string(forKey: "MyAnimal") == nil {
            UserDefaults.standard.set(myAnimal.animal, forKey: "MyAnimal")
        }else {
            customAnimal = myAnimal.animal
            print("viewDidLoad()")
        }
        
    }
    
    
    // MARK: 뷰를 다시 로드했을 때, 테이블 Reload
    override func viewWillAppear(_ animated: Bool) {
        
        myTable.reloadData()
        
        if let vData = data {
            customAnimal.append(vData)
            print("viewWillAppear")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 섹션 갯수는 1개로 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: 셀의 갯수를 배열의 count 만큼 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customAnimal.count
    }
    
    
    // MARK: 셀 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath)
        
        switch indexPath.row {
        case 0...customAnimal.count-1:
            cell.textLabel?.text = customAnimal[indexPath.row]
            cell.imageView?.image = UIImage(named: "\(indexPath.row + 1).png")
        default:
            cell.textLabel?.text = "error- Out of Data"
        }
        
        return cell
    }
    
    // MARK: 셀 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return (UIImage(named: "1.png")?.size.height)!/20
    }
    
    // MARK: 셀 클릭했을 때, segue로 이동
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "add" {
            return
        }else {
            let indexPath = myTable.indexPath(for: sender as! UITableViewCell)
            let sendData:DetailViewController = segue.destination as! DetailViewController
            sendData.data = ((indexPath?.row)! + 1)
        }
    }
}

