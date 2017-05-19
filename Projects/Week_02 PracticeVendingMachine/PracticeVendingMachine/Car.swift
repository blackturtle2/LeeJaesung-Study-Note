//
//  Car.swift
//  PracticeVendingMachine
//
//  Created by leejaesung on 2017. 5. 19..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

class Car {
    let name: String //모델명
    let basicPrice: Int //기본형가격
    var birthYear: Int? //생산연도, 4자리수
    var company: String? //제조사
    
    init(carName name:String, basicPrice price:Int) {
        self.name = name
        self.basicPrice = price
    }
}
