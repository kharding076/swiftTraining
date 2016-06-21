//
//  ViewController.swift
//  Times Table
//
//  Created by Kyle Harding on 8/26/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    let rows = 50
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sliderVal: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return rows
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(sliderVal.value * 50)
        cell.textLabel?.text = String(timesTable * indexPath.row)
        return cell
    }

    @IBAction func sliderChanged(sender: AnyObject) {
        tableView.reloadData()
    }
}

