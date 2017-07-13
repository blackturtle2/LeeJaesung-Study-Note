//
//  ViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mainTableView:UITableView!
    
    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(DataCenter.shared.dataArray)
//        print(DataCenter.shared.dataArray[5].userName)
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
//        self.mainTableView.rowHeight = UITableViewAutomaticDimension
//        self.mainTableView.estimatedRowHeight = 44
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: Custom Logic
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        myCell.labelUserName.text = DataCenter.shared.dataArray[indexPath.row].userName
        myCell.labelUserId.text = DataCenter.shared.dataArray[indexPath.row].userId
        myCell.labelBodyText.text = DataCenter.shared.dataArray[indexPath.row].bodyText
        myCell.imageViewUserProfileImgUrl.image = UIImage(named: DataCenter.shared.dataArray[indexPath.row].userPhotoUrl)
        
        if let data = DataCenter.shared.dataArray[indexPath.row].imageUrl {
            myCell.imageViewContent.isHidden = false
            myCell.imageViewContent.image = UIImage(named: data)
        }
        
        if DataCenter.shared.dataArray[indexPath.row].imageUrl == "" {
            myCell.imageViewContent.removeFromSuperview()
            print("nil")
        }
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }


}
