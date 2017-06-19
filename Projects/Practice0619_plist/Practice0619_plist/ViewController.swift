//
//  ViewController.swift
//  Practice0619_plist
//
//  Created by leejaesung on 2017. 6. 19..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPath = Bundle.main.path(forResource: "FriendList", ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject] {
            
//            let vDic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
            print(dic["list"]!)
            labelResult.text = String(describing: dic["list"]!)
            
        }else {
            // 파일이 존재하지 않음.
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writFile() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: realPath) {
            if let bundlePath = Bundle.main.path(forResource: "FriendList", ofType: "plist") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                } catch  {
                    return
                }
            } else {
                return
            }
        }
       
        let dic = NSDictionary(contentsOfFile: realPath) as? [String : AnyObject]
        
        let nsDic = NSDictionary(dictionary: dic!)
        nsDic.write(toFile: realPath, atomically: true)
        
    }


}

