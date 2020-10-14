//
//  HistoryViewController.swift
//  Practice0623_LottoApp_Closure
//
//  Created by leejaesung on 2017. 6. 23..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var realLottoHistory = UserDefaults.standard.array(forKey: "LottoHistory")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: ***** ***** S.T.A.R.T ***** *****
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realLottoHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        let myRealLottoHistory = realLottoHistory[indexPath.row] as? [Int]
        let myRealLottoHistory = realLottoHistory[realLottoHistory.count - indexPath.row - 1] as? [Int]

        
        myCell.textLabel?.text = String(describing: myRealLottoHistory!)
        
        return myCell
    }

}
