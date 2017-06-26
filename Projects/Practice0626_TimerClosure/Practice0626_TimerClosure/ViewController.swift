//
//  ViewController.swift
//  Practice0626_TimerClosure
//
//  Created by leejaesung on 2017. 6. 26..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var selectedTimeHour: Int?
    var selectedTimeMinute: Int?
    var selectedTimeSecond: Int?
    var selectedTimeRaw: Int?

    @IBOutlet weak var labelMain: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myDatePicker(_ sender: UIDatePicker) {
//        let myDateFormatter = DateFormatter()
//        myDateFormatter.dateFormat = "h:mm"
//        selectedTime = myDateFormatter.string(from: sender.date)
//        데이트포맷을 사용해서 계산하려고 했으나, countDownDuration이 있어서 피커의 값을 초 단위로 바꿔준다.
        
        selectedTimeRaw = Int(sender.countDownDuration)

        if sender.countDownDuration <= 3600 {
            selectedTimeHour = 0
            selectedTimeMinute = Int(sender.countDownDuration) / 60
            selectedTimeSecond = Int(sender.countDownDuration) % 60
            labelMain.text = "\(selectedTimeMinute!) : \(selectedTimeSecond!)"
        } else {
            selectedTimeHour = Int(sender.countDownDuration) / 3600
            selectedTimeMinute = Int(sender.countDownDuration) % 3600 / 60
            selectedTimeSecond = Int(sender.countDownDuration) % 60
            labelMain.text = "\(selectedTimeHour!) : \(selectedTimeMinute!) : \(selectedTimeSecond!)"
        }
        
    }
    
    @IBAction func buttonStart(_ sender: UIButton) {
        startTimer(forMin: selectedTimeMinute!)
    }
    
    func startTimer(forMin minute: Int) {
        let seconds: Int = minute * 60
        var index: Int = 0
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer: Timer) in
            print(index)
            
            index += 1
            if index > seconds {
                timer.invalidate()
            }
        })
        
        self.timer?.fire()
    }
    
}

