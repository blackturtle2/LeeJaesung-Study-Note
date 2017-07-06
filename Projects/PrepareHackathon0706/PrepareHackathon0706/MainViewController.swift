//
//  ViewController.swift
//  PrepareHackathon0706
//
//  Created by leejaesung on 2017. 7. 6..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

import Toaster
import YNDropDownMenu
import NotificationBannerSwift

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // MARK: ***** 드롭다운 메뉴 *****
        let ZBdropDownViews = Bundle.main.loadNibNamed("DropDownViews", owner: nil, options: nil) as? [UIView]
        let FFA409 = UIColor(colorLiteralRed: 255/255, green: 164/255, blue: 9/255, alpha: 1.0)
        
        if let _ZBdropDownViews = ZBdropDownViews {
            // Inherit YNDropDownView if you want to hideMenu in your dropDownViews
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 38), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["Apple", "Banana", "Kiwi", "Pear"])
            
//            view.setImageWhen(normal: UIImage(named: "arrow_nor"), selected: UIImage(named: "arrow_sel"), disabled: UIImage(named: "arrow_dim"))
            //view.setImageWhen(normal: UIImage(named: "arrow_nor"), selectedTintColor: FFA409, disabledTintColor: FFA409)
            //view.setImageWhen(normal: UIImage(named: "arrow_nor"), selectedTintColorRGB: "FFA409", disabledTintColorRGB: "FFA409")
            
            view.setLabelColorWhen(normal: .black, selected: FFA409, disabled: .gray)
//            view.setLabelColorWhen(normalRGB: "000000", selectedRGB: "FFA409", disabledRGB: "FFA409")
            
            view.setLabelFontWhen(normal: .systemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 12), disabled: .systemFont(ofSize: 12))
            //            view.setLabel(font: .systemFont(ofSize: 12))
            
            view.backgroundBlurEnabled = true
            //            view.bottomLine.backgroundColor = UIColor.black
            view.bottomLine.isHidden = false
            // Add custom blurEffectView
            let backgroundView = UIView()
            backgroundView.backgroundColor = .black
            view.blurEffectView = backgroundView
            view.blurEffectViewAlpha = 0.7
            
            // Open and Hide Menu
            view.alwaysSelected(at: 0)
            //            view.disabledMenuAt(index: 2)
            //view.showAndHideMenuAt(index: 3)
            self.view.addSubview(view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: ***** NotificationBanner *****
    @IBAction func buttonTest(_ sender:UIButton) {
        let banner = NotificationBanner(title: "title", subtitle: "subtitle", style: .success)
        banner.show()
    }
    
    @IBAction func buttonToaster(_ sender:UIButton) {
        // MARK: ***** 토스터 *****
        Toast(text: "Hello, world!").show()
    }


}

