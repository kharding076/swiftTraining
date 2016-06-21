//
//  ViewController.swift
//  json example
//
//  Created by Kyle Harding on 9/22/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://www.googleapis.com/blogger/v3/blogs/10861780/posts?key=AIzaSyC23MlBg2NAewEKhJqSh4jsXHNdASqk5DU")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if let UrlContent = data{
               
                
                do{
                     let jsonResult = try NSJSONSerialization.JSONObjectWithData(UrlContent, options: NSJSONReadingOptions.MutableContainers)
                    let dictonary = self.JSONParseDictionary(jsonResult.string)
                    
                    let title = dictonary["title"] as? String
                    print(title)
                }catch{
                    print("Error")
                }
            }
        }
        
        task.resume()
    }
    
    func JSONParseDictionary(string: String) -> [String: AnyObject]{
        
        
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding){
            
            do{
                if let dictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String: AnyObject]{
                    
                    return dictionary
                    
                }
            }catch {
                
                print("error")
            }
        }
        return [String: AnyObject]()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

