//
//  MainTabbarViewController.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 25..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        setSubviews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setSubviews() {
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        vc1.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        vc1.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        vc2.tabBarItem.image = #imageLiteral(resourceName: "search_unselected")
        vc2.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_selected")
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .blue
        vc3.tabBarItem.image = #imageLiteral(resourceName: "plus_unselected")
        vc3.tabBarItem.selectedImage = #imageLiteral(resourceName: "plus_unselected")
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .blue
        vc4.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
        vc4.tabBarItem.selectedImage = #imageLiteral(resourceName: "like_selected")
        
        
        let vc5 = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        vc5.view.backgroundColor = .blue
        vc5.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        vc5.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_unselected")
        
        viewControllers = [ vc1, vc2, vc3, vc4, vc5 ]
    }
    
    
}

