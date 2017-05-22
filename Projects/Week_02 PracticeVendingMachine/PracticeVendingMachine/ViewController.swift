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
    
    
    let bmwX5:Car = Car(carName: "X5", basicPrice: 95900000)
    let bmw520d:Car = Car(carName: "520d", basicPrice: 70941000)
    let bentsEclass:Car = Car(carName: "E-class", basicPrice: 65163000)
    let sonata:Car = Car(carName: "Sonata", basicPrice: 22550000)
    
    var currentBasicPrice: Int = 0
    var totalPrice: Int = 0
    var isAddOption = false
    
    // 옵션이 2번 선택되지 않도록 세팅 시작........ 20170519
    var selectedOption: [String:Int] = [String:Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        
    // 자동차 버튼 터치했을 때, 액션 정의
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
        case "x5":
            showDialog(title: "BMW X5", message: "BMW X5는 BMW에서 만든 최초의 스포츠 유틸리티 자동차입니다.")
            labelSelectedCarMoney.text = "\(addCommafor(money: bmwX5.basicPrice)) 원 (\(bmwX5.name))"
            currentBasicPrice = bmwX5.basicPrice
            totalPrice = bmwX5.basicPrice
        case "eclass":
            showDialog(title: "Benz E-Class", message: "메르세데스-벤츠 E 클래스(Mercedes-Benz E-Class)는 다임러 AG가 제조하여 메르세데스-벤츠 브랜드로 판매하는 승용차입니.")
            labelSelectedCarMoney.text = "\(addCommafor(money: bentsEclass.basicPrice)) 원 (\(bentsEclass.name))"
            currentBasicPrice = bentsEclass.basicPrice
            totalPrice = bentsEclass.basicPrice
        case "sonata":
            showDialog(title: "현대 소나타", message: "현대 쏘나타(Hyundai Sonata)는 1985년에 출시되어 현재까지 판매되고 있는 현대자동차의 중형차이자 대한민국의 대표적인 중형차입니다.")
            labelSelectedCarMoney.text = "\(addCommafor(money: sonata.basicPrice)) 원 (\(sonata.name))"
            currentBasicPrice = sonata.basicPrice
            totalPrice = sonata.basicPrice
        default:
            return
        }
        
    }
    
    // MARK : 옵션 버튼 정의
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
        case "후방카메라":
            totalPrice += 500000
            labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
            
        case "내비게이션":
            totalPrice += 750000
            labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
            selectedOption = ["내비게이션":1]
        case "썬루프":
            totalPrice += 1500000
            labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
            selectedOption = ["썬루프":1]
        case "자율주행":
            totalPrice += 30000000
            labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
            selectedOption = ["자율주행":1]
        case "고급타이어":
            totalPrice += 250000
            labelTotalMoney.text = "\(addCommafor(money: totalPrice)) 원"
            selectedOption = ["고급타이어":1]
        default:
            print("error- vSelectedOption")
        }
        
    }
    
    
    // 계산하기 버튼 터치했을 때, 액션 정의
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
    
    // 금액에 세자리수마다 콤마(,)를 찍는 함수
    func addCommafor(money:Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(value:money))!
        
        return result
    }
    
    
    // 다이얼로그 띄우는 함수
    func showDialog(title: String, message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
    }
    
    
    // MARK: didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

