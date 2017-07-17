//
//  ViewController.swift
//  Practice0717_HonsulDataModeling
//
//  Created by leejaesung on 2017. 7. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

let cellIdentifier = "recipeCell"

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableViewMain:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(DataCenter.sharedInstance.rawData)
        
        self.tableViewMain.delegate = self
        self.tableViewMain.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // UITableView Delegate & DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.sharedInstance.rawData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecipeTableViewCell
        
        myCell.imageViewMain.image = UIImage(named: DataCenter.sharedInstance.getRecipeImageOf(id: indexPath.row))
        myCell.labelName.text = DataCenter.sharedInstance.getRecipeNameOf(id: indexPath.row)
        myCell.labelShortDescription.text = DataCenter.sharedInstance.getRecipeShortDescriptionOf(id: indexPath.row)
        
        return myCell
    }


}

