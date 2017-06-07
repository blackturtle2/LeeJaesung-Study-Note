//
//  AddViewController.swift
//  Practice0607_TableView_Friends
//
//  Created by leejaesung on 2017. 6. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textfieldUserInput: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSaveAction(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc:MainViewController = segue.destination as! MainViewController
        
        vc.data = textfieldUserInput.text
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
