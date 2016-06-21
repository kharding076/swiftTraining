//
//  ViewController.swift
//  RunningCalc
//
//  Created by Kyle Harding on 7/6/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    var strXmlData:String = ""
    var currentElement:String = ""
    var passData:Bool=false
    var passName:Bool=false
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func buttonPressed(sender: AnyObject) {
        var parser = NSXMLParser(contentsOfURL: <#NSURL!#>)
        result.text = "You clicked the button"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

