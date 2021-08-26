//
//  PrivacyViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Vaibhav Shah on 12/08/21.
//

import UIKit
import WebKit

class PrivacyViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - !!Add Link Hear!!
        webView.load(URLRequest(url: URL(string: "https://en.m.wikipedia.org/wiki/Main_Page")!))
        // Do any additional setup after loading the view.
    }
    
}
