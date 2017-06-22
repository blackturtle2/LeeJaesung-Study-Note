//
//  CarOption.swift
//  PracticeVendingMachine
//
//  Created by leejaesung on 2017. 5. 22..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class CarOption {
    
    var optionFree:Bool = false
    
    var rearCamera:Bool = false
    var navigation:Bool = false
    var sunRoof:Bool = false
    var autoDriving:Bool = false
    var premiumTire:Bool = false
    
    init() {
        self.optionFree = false
        self.rearCamera = false
        self.navigation = false
        self.sunRoof = false
        self.autoDriving = false
        self.premiumTire = false
    }
    
    func setFree() {
        self.optionFree = false
        self.rearCamera = false
        self.navigation = false
        self.sunRoof = false
        self.autoDriving = false
        self.premiumTire = false
    }
}
