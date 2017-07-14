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
    var mainBoxView:UIView!
    var textFieldTweet:UITextField!
    
    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(DataCenter.shared.dataArray)
//        print(DataCenter.shared.dataArray[5].userName)
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    // MARK: Add button Action
    @IBAction func addButtonAction(_ sender:UIButton) {
        let mainBoxWidth:CGFloat = 300
        let mainBoxHeight:CGFloat = 180
        
        mainBoxView = UIView(frame: CGRect(x: (self.view.bounds.width-300)/2, y: (self.view.bounds.height-100)/3, width: mainBoxWidth, height: mainBoxHeight))
        
        let tempText:UILabel = UILabel(frame: CGRect(x: 8, y:8, width: 100, height: 15))
        textFieldTweet = UITextField(frame: CGRect(x: 8, y: tempText.bounds.height+16, width: mainBoxWidth-16, height: 100))
        
        let cancelButton:UIButton = UIButton(frame: CGRect(x: 0, y: mainBoxView.bounds.height-50, width: mainBoxWidth/2, height: 48))
        let saveButton:UIButton = UIButton(frame: CGRect(x: mainBoxWidth/2, y: mainBoxView.bounds.height-50, width: mainBoxWidth/2, height: 48))
        
        
        mainBoxView.backgroundColor = UIColor.black
        
        tempText.text = "Enjoy Tweet-!"
        tempText.textColor = UIColor.white
        
        textFieldTweet.backgroundColor = UIColor.white
        
        cancelButton.setTitle("CANCEL", for: .normal)
        cancelButton.setTitleColor(UIColor.red, for: .normal)
        cancelButton.addTarget(self, action: #selector(tweetViewCancelButtonAction), for: .touchUpInside)

        saveButton.setTitle("SAVE", for: .normal)
        saveButton.setTitleColor(UIColor.blue, for: .normal)
        saveButton.addTarget(self, action: #selector(tweetViewSaveButtonAction), for: .touchUpInside)
        
        self.view.addSubview(mainBoxView)
        mainBoxView.addSubview(tempText)
        mainBoxView.addSubview(cancelButton)
        mainBoxView.addSubview(saveButton)
        mainBoxView.addSubview(textFieldTweet)
        
    }
    
    func tweetViewCancelButtonAction(sender: UIButton!) {
        print("Cancel Button tapped")
        
        self.mainBoxView.removeFromSuperview()
    }
    
    func tweetViewSaveButtonAction(sender: UIButton!) {
        print("Save Button tapped")
        
        
        
        self.mainBoxView.removeFromSuperview()
        self.mainTableView.reloadData()
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
