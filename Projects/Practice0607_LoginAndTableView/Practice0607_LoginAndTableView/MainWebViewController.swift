//
//  MainWebViewController.swift
//  Practice0607_LoginAndTableView
//
//  Created by leejaesung on 2017. 6. 8..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainWebViewController: UIViewController {
    
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
//        if UserDefaults.standard.bool(forKey: Authentification.isLogin) == false {
//            self.performSegue(withIdentifier: "moveLogin", sender: self)
//        }
        
    }
    
    // 뷰가 뜨고 indicator를 표시하지 않습니다.
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    /// Powered by APPLE ///
    
    // MARK: - Convenience
    
    func loadAddressURL() {
        if let requestURL = URL(string: "https://blackturtle2.net") {
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
    
}
