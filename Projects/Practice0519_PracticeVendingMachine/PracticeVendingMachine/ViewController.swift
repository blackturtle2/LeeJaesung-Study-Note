//
//  ViewController.swift
//  PracticeVendingMachine
//
//  Created by leejaesung on 2017. 5. 19..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSelectedCarMoney: UILabel!
    @IBOutlet weak var textfieldUserMoney: UITextField!
    @IBOutlet weak var labelRestMoney: UILabel!
    @IBOutlet weak var labelAbailableCar: UILabel!
    @IBOutlet weak var labelTotalMoney: UILabel!
    
    // 우리 자동차 애기들
    let bmwX5:Car = Car(carName: "X5", basicPrice: 95900000)
    let bmw520d:Car = Car(carName: "520d", basicPrice: 70941000)
    let bentsEclass:Car = Car(carName: "E-class", basicPrice: 65163000)
    let sonata:Car = Car(carName: "Sonata", basicPrice: 22550000)
    
    // 가격 관련 변수
    var currentBasicPrice: Int = 0
    var totalPrice: Int = 0
    
    // 구매 가능 여부 체크할 때, 사용자가 "옵션 없음"이라도 누르게 하려는 변수.
    var isAddOption:Bool = false
    
    // 옵션 두번 누르면, Alert 띄우게 하려고 만든 클래스 // 클래스 말고 배열, 튜플 같은걸로 해볼껄..
    var optionList:CarOption = CarOption()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 뷰가 뜨자마자 다이얼로그를 띄우는 아이.
    override func viewDidAppear(_ animated: Bool) {
        showDialog(title: "알림", message: "JS Motors에 오신 것을 환영합니다. 차량을 먼저 선택해주세요.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    // MARK: 자동차 버튼 액션 정의
    @IBAction func buttonCar(_ sender: UIButton) {
        guard let vTitle = sender.currentTitle else {
            print("error- buttonCar")
            return
        }
        
        switch vTitle {
        case "520d":
            showDialog(title: "BMW 520d", message: "BMW 5 시리즈(BMW 5 Series)는 독일의 BMW가 생산하는 승용차로, E 세그먼트에 속하는 차량입니다.")
            labelSelectedCarMoney.text = "\(addCommafor(money: bmw520d.basicPrice)) 원 (\(bmw520d.name))"
            currentBasicPrice = bmw520d.basicPrice
            totalPrice = bmw520d.basicPrice
            selectCarFree()
        case "x5":
            showDialog(title: "BMW X5", message: "BMW X5는 BMW에서 만든 최초의 스포츠 유틸리티 자동차입니다.")
            labelSelectedCarMoney.text = "\(addCommafor(money: bmwX5.basicPrice)) 원 (\(bmwX5.name))"
            currentBasicPrice = bmwX5.basicPrice
            totalPrice = bmwX5.basicPrice
            selectCarFree()
        case "eclass":
            showDialog(title: "Benz E-Class", message: "메르세데스-벤츠 E 클래스(Mercedes-Benz E-Class)는 다임러 AG가 제조하여 메르세데스-벤츠 브랜드로 판매하는 승용차입니다. ")
            labelSelectedCarMoney.text = "\(addCommafor(money: bentsEclass.basicPrice)) 원 (\(bentsEclass.name))"
            currentBasicPrice = bentsEclass.basicPrice
            totalPrice = bentsEclass.basicPrice
            selectCarFree()
        case "sonata":
            showDialog(title: "현대 소나타", message: "현대 쏘나타(Hyundai Sonata)는 1985년에 출시되어 현재까지 판매되고 있는 현대자동차의 중형차이자 대한민국의 대표적인 중형차입니다.")
            labelSelectedCarMoney.text = "\(addCommafor(money: sonata.basicPrice)) 원 (\(sonata.name))"
            currentBasicPrice = sonata.basicPrice
            totalPrice = sonata.basicPrice
            selectCarFree()
        default:
            return
        }
        
    }
    
    // 차량 선택시 초기화 함수
    func selectCarFree() {
        isAddOption = false
        optionList.setFree()
        labelTotalMoney.text = ""
        labelRestMoney.text = ""
        labelAbailableCar.text = ""
        
    }
    
    // MARK: MARK : 옵션 버튼 액션 정의
    @IBAction func buttonOption(_ sender: UIButton) {
        guard let vSelectedOption = sender.currentTitle else {
            print("error- buttonOption")
            return
        }
        
        isAddOption = true
        
        switch vSelectedOption {
        case "옵션 없음":
            totalPrice = currentBasicPrice
            labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
            optionList.setFree()
        case "후방카메라":
            if optionList.rearCamera {
                showDialog(title: "알림", message: "선택한 옵션입니다.")
            }else {
                totalPrice += 500000
                labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
                optionList.rearCamera = true
            }
        case "내비게이션":
            if optionList.navigation {
                showDialog(title: "알림", message: "선택한 옵션입니다.")
            }else {
                totalPrice += 750000
                labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
                optionList.navigation = true
            }
        case "썬루프":
            if optionList.sunRoof {
                showDialog(title: "알림", message: "선택한 옵션입니다.")
            }else {
                totalPrice += 1500000
                labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
                optionList.sunRoof = true
            }
        case "자율주행":
            if optionList.autoDriving {
                showDialog(title: "알림", message: "선택한 옵션입니다.")
            }else {
                totalPrice += 30000000
                labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
                optionList.autoDriving = true
            }
        case "고급타이어":
            if optionList.premiumTire {
                showDialog(title: "알림", message: "선택한 옵션입니다.")
            }else {
                totalPrice += 250000
                labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
                optionList.premiumTire = true
            }
        default:
            print("error- vSelectedOption")
        }
        
    }
    
    
    // MARK: 계산하기 버튼 터치했을 때, 액션 정의
    @IBAction func buttonConfirm(_ sender: UIButton) {
        if (textfieldUserMoney.text?.isEmpty)! {
            labelRestMoney.text = " - 구매 가능 금액을 먼저 입력해주세요."
            return
        }
        
        let userMoney:String = textfieldUserMoney.text!
        
        if isAddOption || labelTotalMoney.text == nil {
            let restMoney: Int = Int(userMoney)! - totalPrice
            //let strRestMoney: String = addCommafor(money: (Int(userMoney)! - totalPrice))
            
            if restMoney < 0 {
                let strRestMoney: String = addCommafor(money: totalPrice - (Int(userMoney)!))
                labelAbailableCar.text = "구매 불가능합니다."
                labelRestMoney.text = " - 금액이 \(strRestMoney)원 부족합니다."
            }else {
                let strRestMoney: String = addCommafor(money: (Int(userMoney)! - totalPrice))
                labelAbailableCar.text = "구매 가능합니다."
                labelRestMoney.text = " - 잔금이 \(strRestMoney)원 남았습니다."
            }
        }else {
            labelRestMoney.text = " - 차량이나 옵션을 먼저 선택해주세요."
        }
        
    }
    
    // MARK: 금액에 세자리수마다 콤마(,)를 찍는 함수
    func addCommafor(money:Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(value:money))!
        
        return result
    }
    
    
    // MARK: 다이얼로그 띄우는 함수
    func showDialog(title: String, message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
    }
}

