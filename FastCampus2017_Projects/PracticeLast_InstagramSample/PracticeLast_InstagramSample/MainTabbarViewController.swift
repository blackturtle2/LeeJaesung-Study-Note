//
//  MainTabbarViewController.swift
//  PracticeLast_InstagramSample
//
//  Created by leejaesung on 2017. 7. 25..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import Firebase
import Toaster

class MainTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
//        do {
//            try Auth.auth().signOut()
//        } catch  {
//            
//        }
//        
        print("//////Auth: ", Auth.auth().currentUser ?? "nil")
        
        if !DataCenter.sharedData.requestLogin() {
            DispatchQueue.main.async {
                self.showLoginVC()
            }
        }
        
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
        let vc5Navi = UINavigationController(rootViewController: vc5)
        
        vc5Navi.view.backgroundColor = .blue
        vc5Navi.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        vc5Navi.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_unselected")
        // 탭바 버튼은 탭바 컨트롤러의 자식 뷰인 내비게이션 컨트롤러가 지정하고, 내비게이션 바는 내비게이션 컨트롤러의 자식인 뷰 컨트롤러가 지정한다.
        
        viewControllers = [ vc1, vc2, vc3, vc4, vc5Navi ]
    }
    
    func showLoginVC() {
        let loginVC = LoginViewController()
        let navi = UINavigationController(rootViewController: loginVC)
        self.present(navi, animated: true, completion: nil)
        Toast.init(text: "로그아웃 되었습니다.").show()
    }
    
    
}

