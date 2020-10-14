//
//  DataCenter.swift
//  Practice0717_HonsulDataModeling
//
//  Created by leejaesung on 2017. 7. 17..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

struct recipe {
    let recipeID:Int
    let name:String
    let time:Int
    let cost:Int
    let drink:String
    let ingrediants:String
    let detail:String
    let shortDescription:String
    
    init(data aData:[String:Any]) {
        self.recipeID = aData["recipeID"] as! Int
        self.name = aData["name"] as! String
        self.time = aData["time"] as! Int
        self.cost = aData["cost"] as! Int
        self.drink = aData["drink"] as! String
        self.ingrediants = aData["ingrediants"] as! String
        self.detail = aData["detail"] as! String
        self.shortDescription = aData["shortDescription"] as! String
    }

}

class DataCenter {
    
    // Singleton
    static let sharedInstance = DataCenter()
    
    var rawData:[recipe] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        let docuPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let recipeListDocuPath = docuPath[0] + "/HSRecipeList.plist"
        
        if !FileManager.default.fileExists(atPath: recipeListDocuPath) {
            if let bundlePath = Bundle.main.path(forResource: "HSRecipeList", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: recipeListDocuPath)
                } catch {
                    print("Error- try-catch")
                    return
                }
            } else {
                print("Error- 번들에 파일이 없습니다.")
                return
            }
        }
        
        let tempRawData:[[String:Any]] = NSArray(contentsOfFile: recipeListDocuPath) as! [[String:Any]]
        
        for item in tempRawData {
            self.rawData.append(recipe(data: item))
        }
    }
    
    func getRecipeImageOf(id anId:Int) -> String {
        return "\(anId).jpg"
    }
    
    func getRecipeNameOf(id anId:Int) -> String {
        return rawData[anId].name
    }
    
    func getRecipeShortDescriptionOf(id anId:Int) -> String {
//        return rawData[anId].shortDescription ?? "(no data)"
        return rawData[anId].shortDescription
    }
    
}
