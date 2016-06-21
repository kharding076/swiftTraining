//
//  ViewController.swift
//  TimesTable
//
//  Created by Kyle Harding on 8/6/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var timesTable: UITableView!

    @IBAction func sliderChanged(sender: AnyObject) {
       timesTable.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let table = Int(sliderValue.value * 20)
        
        cell.textLabel?.text =  String(table * indexPath.row)
        
        return cell
        
    }
}

