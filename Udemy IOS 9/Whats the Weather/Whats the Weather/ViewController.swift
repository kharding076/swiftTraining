//
//  ViewController.swift
//  Whats the Weather
//
//  Created by Kyle Harding on 8/30/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var lblThreeDay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func findForecast(sender: AnyObject) {
        
        let baseUrl = "http://www.weather-forecast.com/locations/"
        let city = txtCity.text!
        let st = "\(baseUrl)\(city)/forecasts/latest"
       
        let url = NSURL(string: st)!
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)!
                
                let webSiteArray = webContent.componentsSeparatedByString("Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                if webSiteArray.count > 0 {
                   let weatherArray = webSiteArray[1].componentsSeparatedByString("</span>")
                    if webSiteArray.count > 0 {
                        let summary = weatherArray[0]
                        self.lblThreeDay.text = summary
                        
                    }
                }
                
            }else{
                //show error
            }
        }
        
        task.resume()
    }

}

