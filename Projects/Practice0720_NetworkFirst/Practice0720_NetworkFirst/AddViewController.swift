//
//  AddViewController.swift
//  Practice0720_NetworkFirst
//
//  Created by leejaesung on 2017. 7. 20..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

extension NSMutableData {
    func appendString(_ str:String) {
        self.append(str.data(using: .utf8)!)
    }
}

class AddViewController: UIViewController {
    
    @IBOutlet var textFieldEmail:UITextField!
    @IBOutlet var textFieldPassword:UITextField!
    
    @IBAction func buttonComplete(_ sender:UIButton) {
        saveData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func saveData() {
        let url = URL(string: "http://localhost:1337/user")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let body = NSMutableData()
        body.appendString("{\"email\" : \"\(textFieldEmail.text!)\", \"password\" : \"\(textFieldPassword.text!)\"}")
//        request.httpBody = body as Data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.uploadTask(with: request, from: body as Data) { (data, response, error) in
            print("COMPLETE!")
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        task.resume()
        
        
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            
//            guard let data = data else {return}
//            print(response!)
//            
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary {
//                print(json)
//            }
//            
//            DispatchQueue.main.async {
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
        
        
        //        print("task: \(task)")
        
//        let params = [
//            "email" : textFieldEmail.text,
//            "password" : textFieldPassword.text
//        ]
//        
//        if let jsonStr = try? JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0)) {
//            let url = URL(string: "http://localhost:1337/user")
//            var request = URLRequest(url: url!)
//            request.httpMethod = "POST"
//            request.httpBody = jsonStr
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            
//            let task = URLSession.shared.dataTask(with: request) {
//                data, response, error in
//                guard let data = data else {return}
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary {
//                    DispatchQueue.main.async {
//                        self.navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//            task.resume()
//        }
        
    }


}
