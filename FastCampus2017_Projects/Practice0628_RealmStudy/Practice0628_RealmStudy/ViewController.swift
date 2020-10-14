//
//  ViewController.swift
//  Practice0628_RealmStudy
//
//  Created by leejaesung on 2017. 6. 28..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "idols", ofType: "plist")!
        print("idol plist's path: \(path)")
        
        guard let content = NSArray(contentsOfFile: path) as? Array<String> else { return }
        let names = content
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let docuPath = documentPath + "/copied.plist"
        print("docuPath: \(docuPath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

