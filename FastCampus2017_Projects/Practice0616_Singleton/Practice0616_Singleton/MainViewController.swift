//
//  ViewController.swift
//  Practice0616_Singleton
//
//  Created by leejaesung on 2017. 6. 16..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var textfieldInput:UITextField?
    @IBOutlet var labelData:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelData?.text = DataCenter.sharedData.textData
        
    }
    
    @IBAction func buttonAction(_ sender:UIButton) {
        
        DataCenter.sharedData.textData = textfieldInput?.text ?? "test"
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

