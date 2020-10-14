//
//  ViewController.swift
//  Practice0601_NavigationViewController
//
//  Created by leejaesung on 2017. 6. 1..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveNextView() {
        let vc:NextViewController = self.storyboard?.instantiateViewController(withIdentifier: "Next") as! NextViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func closeView() {
        self.dismiss(animated: true, completion: nil)
    }


}

