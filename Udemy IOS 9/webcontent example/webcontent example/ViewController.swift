//
//  ViewController.swift
//  webcontent example
//
//  Created by Kyle Harding on 9/22/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let html = "<html><body><h1>Hi</h1></body></html>"
        webview.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

