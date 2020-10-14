//
//  ViewController.swift
//  Practice0629_UIGestureRecognizer
//
//  Created by leejaesung on 2017. 6. 29..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelPoint: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
    
    var touchNumber:Int = 0
    var touchLocation:CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchAction(_ sender: UITapGestureRecognizer) {
        
        var newFrame = self.labelPoint.frame
        
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseIn,.autoreverse], animations: { 
//            var newFrame = self.labelPoint.frame
//            newFrame.origin.y -= 200
//            self.labelPoint.frame = newFrame
            
            newFrame.origin.y -= 200
            self.labelPoint.frame = newFrame
            
            
        }) { (true) in
            newFrame.origin.y += 200
            self.labelPoint.frame = newFrame
        }
        
        if touchLocation == sender.location(in: self.view) {
            touchNumber += sender.numberOfTouches
        }else {
            touchNumber = 1
        }
        touchLocation = sender.location(in: self.view)
        
        labelNumber.text = String(touchNumber)
        labelPoint.text = String(describing: touchLocation!)
        
    }
    

}

