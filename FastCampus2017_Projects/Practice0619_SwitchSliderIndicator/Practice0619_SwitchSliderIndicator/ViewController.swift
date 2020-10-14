//
//  ViewController.swift
//  Practice0619_SwitchSliderIndicator
//
//  Created by leejaesung on 2017. 6. 19..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSwitchValue: UILabel!
    @IBOutlet weak var labelSliderValue: UILabel!
    @IBOutlet weak var activityIndicatorMain: UIActivityIndicatorView!
    
    @IBOutlet weak var switchMain: UISwitch!
    @IBOutlet weak var viewBackgroundTest: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMain(_ sender: UISlider) {
        
        labelSliderValue.text = String(sender.value)

    }
    
    @IBAction func switchMain(_ sender: UISwitch) {
        
        labelSwitchValue.text = String(sender.isOn)
        
        if sender.isOn {
            labelSwitchValue.textColor = UIColor.blue
            viewBackgroundTest.backgroundColor = UIColor.yellow
        }else {
            labelSwitchValue.textColor = UIColor.red
            viewBackgroundTest.backgroundColor = UIColor.blue
        }
        
    }

    @IBAction func buttonIndicatorOnOff(_ sender: UIButton) {
        
        if activityIndicatorMain.isAnimating {
            activityIndicatorMain.stopAnimating()
        }else {
            activityIndicatorMain.startAnimating()
        }
        
    }

}

