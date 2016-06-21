//
//  SecondViewController.swift
//  To Do List
//
//  Created by Kyle Harding on 8/27/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtItem: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(sender: AnyObject) {
       let item = txtItem.text!
        toDoList.append(item)

        NSUserDefaults.standardUserDefaults().setObject(item, forKey: "toDoList")
        txtItem.text = ""
    }

}

