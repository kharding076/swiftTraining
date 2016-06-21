//
//  ViewController.swift
//  NSXMLParser
//
//  Created by Kyle Harding on 7/7/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var strXMLData:String = ""
    var currentElement:String = ""
    var passData:Bool = false
    var passName:Bool = false
    
    
    @IBOutlet weak var lblNameData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url : String = "http://api.androidhive.info/pizza"
        var urlToSend : NSURL = NSURL(string: url)
        var parser = NSXMLParser(contentsOfURL : urlToSend)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

