//
//  ViewController.swift
//  Data storage
//
//  Created by Kyle Harding on 8/11/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSUserDefaults .standardUserDefaults().setObject("Kyle", forKey: "name")
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! String
        
        println(name)
        
        var arr = [1,2,3]
        NSUserDefaults .standardUserDefaults().setObject(arr, forKey: "array")
        
        var valArr = NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
        println(valArr[3])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

