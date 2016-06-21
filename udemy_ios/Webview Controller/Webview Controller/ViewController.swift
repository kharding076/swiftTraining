//
//  ViewController.swift
//  Webview Controller
//
//  Created by Kyle Harding on 7/30/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "http://www.sourcefreeze.com");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

