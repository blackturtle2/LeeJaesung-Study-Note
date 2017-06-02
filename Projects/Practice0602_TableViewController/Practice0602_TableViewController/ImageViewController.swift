//
//  ImageViewController.swift
//  Practice0602_TableViewController
//
//  Created by leejaesung on 2017. 6. 2..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageViewPocketmon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pocketmonID = String(UserDefaults.standard.integer(forKey: "SelectedPocketmon"))
        
        print(pocketmonID)
        imageViewPocketmon.image = UIImage(named: pocketmonID)
        
//        labelName.text = pocketmonID

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
