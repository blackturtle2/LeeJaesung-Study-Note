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
        
        writeFile()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // plist에 파일 쓰기
    func writeFile() {
        // 1단계: document 폴더에서 path 찾아보기.
        let docuPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realDocuPath = docuPath[0] + "/FriendList.plist"
        
        // 2단계: document 폴더에 plist 파일이 실제로 있는지 확인하기.
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: realDocuPath) {
            // 3단계: realPath에 파일이 실제로 존재하는지 체크하고, 없다면..
            // 번들에 있는 FriendList.plist의 path를 가져온다.
            if let bundlePath = Bundle.main.path(forResource: "FriendList", ofType: "plist") {
                do {
                    // 파일매니저에게 아이템 복사를 요청한다. >> FileManager.default.copyItem()
                    // 위치는 bundelPath에서부터 realDocuPath로 한다.
                    // 즉, bundle에서 document로 땡겨온다.
                    try fileManager.copyItem(atPath: bundlePath, toPath: realDocuPath)
                } catch  {
                    // 안되면 리턴하고..
                    return
                }
            } else {
                // 번들에도 파일이 없으면, 역시 리턴하고..
                return
            }
        }
        
        // 3단계: realDocuPath로부터 가져온 NSDictionary를 dic에 넣는다.
        var dicData = NSDictionary(contentsOfFile: realDocuPath) as? [String : Any]
        
        
        //-- 수정 사항 반영 시작 --//
        let currentVersion = dicData?["Version"] as! NSNumber
        currentVersion.intValue
        
        print("currentVersion: \(currentVersion)")
        let updateVersion = currentVersion + 1
        dicData?.updateValue(updateVersion as AnyObject, forKey: "Version")
        print("코드명 0505 - dicData: \(dicData!)")
        //-- 수정 사항 반영 끝 --//
        
        // 4단계: document 폴더의 plist에 드디어 쓰기.
        // writeToFile 메소드를 사용한다.
        let nsDic = NSDictionary(dictionary: dicData!)
        nsDic.write(toFile: realDocuPath, atomically: true)
        print("코드명 0506 - nsDic: \(nsDic)")
    }
}

