//
//  MainViewController.swift
//  LoginPageProject
//
//  Created by leejaesung on 2017. 5. 31..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebView()
        loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 뷰가 뜨자마자 로그인 여부를 체크합니다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // UserDefaults의 isLogin 값이 false이면, 로그인 뷰로 바로 이동합니다.
        // UserDefaults에서 Bool 값은 nil이 아니고, false입니다.
        if UserDefaults.standard.bool(forKey: Authentification.isLogin) == false {
            self.performSegue(withIdentifier: "moveLogin", sender: self)
        }
        
        // 메인 뷰가 뜨고, 환영한다는 Alert이 뜹니다.
//        let alert:UIAlertController = UIAlertController(title: "", message: "\(UserDefaults.standard.string(forKey: Authentification.nickname) ?? "00")님 환영합니다.", preferredStyle: .alert)
//        let alertAction:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//        
//        alert.addAction(alertAction)
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    // 뷰가 뜨고 indicator를 표시하지 않습니다.
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    /// Powered by APPLE ///
    
    // MARK: - Convenience
    
    func loadAddressURL() {
        if let requestURL = URL(string: "https://www.clien.net") {
            let request = URLRequest(url: requestURL)
            webview.loadRequest(request)
        }
    }
    
    // MARK: - Configuration
    
    func configureWebView() {
        webview.backgroundColor = UIColor.white
        webview.scalesPageToFit = true
        webview.dataDetectorTypes = .all
    }
    
    // MARK: - UIWebViewDelegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        // Report the error inside the web view.
        let localizedErrorMessage = NSLocalizedString("An error occured:", comment: "")
        
        let errorHTML = "<!doctype html><html><body><div style=\"width: 100%%; text-align: center; font-size: 36pt;\">\(localizedErrorMessage) \(error.localizedDescription)</div></body></html>"
        
        webview.loadHTMLString(errorHTML, baseURL: nil)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    
    // 메인 뷰의 로그아웃 버튼을 누르면, 로그인 상태를 false라고 UserDefaults에 저장합니다.
    @IBAction func buttonLogoutAction(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: Authentification.isLogin)
        
        let vc:LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
}
