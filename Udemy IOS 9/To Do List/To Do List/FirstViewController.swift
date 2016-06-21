//
//  FirstViewController.swift
//  To Do List
//
//  Created by Kyle Harding on 8/27/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit


var toDoList = [String]()
class FirstViewController: UIViewController, UITableViewDelegate {
   
    
    @IBOutlet weak var tblToDo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().arrayForKey("toDoList") != nil {
            
            toDoList = NSUserDefaults.standardUserDefaults().arrayForKey("toDoList")as! [String]
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String(toDoList[indexPath.row])
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            tblToDo.reloadData()
        }
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        tblToDo.reloadData()
        
    }
    
    

}

