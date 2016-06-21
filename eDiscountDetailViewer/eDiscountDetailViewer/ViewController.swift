//
//  ViewController.swift
//  eDiscountDetailViewer
//
//  Created by Kyle Harding on 6/2/16.
//  Copyright © 2016 harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate {

    @IBOutlet weak var txtDiscountId: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    var dataTask: NSURLSessionDataTask?
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    var xmlParser: NSXMLParser!
    var currentElement: String = ""
    var isInEmail = false;

    
    @IBAction func getDetails(sender: AnyObject) {
    
        let discountId = txtDiscountId.text!
        
        let baseURL = "http://dev-ediscount.sherwin.com/ediscount/email/\(discountId)/summary"
        print(baseURL)
        
        let url: NSURL = NSURL(string:baseURL)!
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                let webContent = String(data: urlContent, encoding: NSUTF8StringEncoding)!
                self.webView.loadHTMLString(webContent, baseURL: nil)
            }
        }
        task.resume()
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
}

