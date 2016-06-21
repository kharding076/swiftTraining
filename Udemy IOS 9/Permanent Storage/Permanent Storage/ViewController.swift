//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Kyle Harding on 8/27/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSUserDefaults.standardUserDefaults().setObject("Kyle", forKey: "name")
        
        let userName = NSUserDefaults.standardUserDefaults().objectForKey("name")!
        print(userName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

