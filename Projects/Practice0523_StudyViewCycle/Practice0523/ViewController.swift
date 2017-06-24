//
//  ViewController.swift
//  Practice0523
//
//  Created by leejaesung on 2017. 5. 23..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("FirstView loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstView viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("FirstView viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("FirstView viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstView viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstView viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FirstView viewDidDisappear")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
 
 override func loadView() : UIViewController의 view가 생성될 때 호출
 
 override func viewDidLoad() :
 UIViewController가 인스턴스화 된 직후(메모리에 객체가 올라간 직후) 호출 처음 한 번 세팅해 줘야하는 값들을 넣기에 적절
 
 override func viewWillAppear(_ animated: Bool) :
 view가 화면에 보여지기 직전에 호출 화면이 보여지기 전에 준비할 때 사용.
 animated 파라미터는 뷰가 애니메이션을 동반하여 보여지게 되는지 시스템에서 전달해주는 불리언 값
 
 override func viewWillLayoutSubviews() : view의 하위뷰들의 레이아웃이 결정되기 직전 호출
 
 override func viewDidLayoutSubviews() :
 view의 하위뷰들의 레이아웃이 결정된 후 호출. 주로 view의 하위뷰들이 사이즈 조정이 필요할 때 호출
 
 override func viewDidAppear(_ animated: Bool) :
 view가 화면에 보여진 직후에 호출. 화면이 표시된 이후 애니메이션 등을 보여주고 싶을 때 유용
 
 override func viewWillAppear(_ animated: Bool) : view가 화면에서 사라지기 직전에 호출
 
 override func viewDidDisappear(_ animated: Bool) : view가 화면에서 사라진 직후에 호출
 
 */
