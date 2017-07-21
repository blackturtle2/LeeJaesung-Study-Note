//
//  UploadViewController.swift
//  Practice0720_NetworkFirst
//
//  Created by leejaesung on 2017. 7. 21..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Alamofire

class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func buttonLoadImage(_ sender:UIButton) {
        let picker = UIImagePickerController.init()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        DispatchQueue.main.async {
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            let url = URL(string: "http://localhost:1337/upload")
//            var request = URLRequest(url: url!)
//            request.httpMethod = "POST"
//            
//            let boundary = "Boudndary-\(UUID().uuidString)"
//            request.setValue("multipart/form-data; charset=utf-8; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//            request.httpBody = createBody(name: "test", boundary: boundary, data: UIImageJPEGRepresentation(pickedImage, 0.7)!, mimeType: "image/jpg", filename: "hello.jpg")
//            
//            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
//                guard let data = data
//                    else { return }
//                
//                print("data: \(data)")
//                print("response: \(response!)")
//                print("error: \(String(describing: error))")
//            })
//            
//            task.resume()
            
            uploadAlamofire(pickedImage: pickedImage)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func createBody(name : String,
                    boundary: String,
                    data: Data,
                    mimeType: String,
                    filename: String) -> Data {
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    
    
    // MARK: Alamofire
    @IBAction func almofireButtonAction(_ sender:UIButton) {
        let picker = UIImagePickerController.init()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        DispatchQueue.main.async {
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func uploadAlamofire(pickedImage : UIImage) {
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(UIImageJPEGRepresentation(pickedImage, 0.7)!, withName: "test", fileName:"test.jpg", mimeType: "image/jpg")
        },
            to: "http://localhost:1337/upload",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
    }
    
    
}
