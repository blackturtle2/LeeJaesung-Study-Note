//
//  ViewController.swift
//  Practice0524
//
//  Created by leejaesung on 2017. 5. 24..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let b1:Book = Book(name: "나는야 스위프트 마스터", cost: 10000, isbn: 999)
        var b2 = b1
        b2.name = "나는야 자바 마스터"
        print("< STRUCT >")
        print(b1.name!)
        print(b2.name!)
        
        let bs1:BookStore = BookStore(name: "나는야 스위프트 마스터")
        let bs2 = bs1 //아래에서 값이 바뀌는 것 같지만, 바뀌지 않는다!!!
        bs2.name = "나는야 자바 마스터"
        print("< CLASS >")
        print(bs1.name)
        print(bs2.name)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

struct Book {
    var name:String?
    var cost:Int?
    var isbn:UInt?
}

class BookStore {
    var name:String = ""
    
    init(name: String) {
        self.name = name
    }
}
