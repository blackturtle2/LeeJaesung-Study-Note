//
//  ViewController.swift
//  Practice0711_Subscript
//
//  Created by leejaesung on 2017. 7. 11..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

struct CustomMatrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    
    init(aRows: Int, aColumns: Int) {
        self.rows = aRows
        self.columns = aColumns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    subscript(aRow:Int, aColumn:Int) -> Double {
        get {
            return grid[(aRow * aColumn) + aColumn]
        }
        set {
            grid[(aRow * aColumn) + aColumn] = newValue
        }
    }
    
}

struct MyCustomArray {
    let name:String
    let age:Int
    let arrData:[[String:Any]]
    
    init(aName:String, anAge:Int) {
        self.name = aName
        self.age = anAge
        arrData = [["name": name, "age": age]]
    }
    
    subscript(anIndex:Int) -> String {
        get {
            return arrData[anIndex]["name"] as! String
        }
        set {
            
        }
    }
}

struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct GenericStack<T> {
    var items = [T]()
    
    mutating func push(_ item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}


class ViewController: UIViewController {
    
    @IBOutlet var labelMain:UILabel?
    
    var myMatrix = CustomMatrix(aRows: 2, aColumns: 2)
    var myFriend = MyCustomArray(aName: "leejaesung", anAge: 30)
    var stringTest = GenericStack(items: ["kimsehwa"])
    var intTest = GenericStack(items: [12])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMatrix[0,0] = 1
        myMatrix[0,1] = 2
        
        print(myMatrix[0,1])
        print(myFriend[0])
        
        stringTest.push("ImFineThankyou")
        intTest.push(13)
        
        print(stringTest)
        print(intTest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}




