//
//  ViewController.swift
//  TempConvertSoapExample
//
//  Created by Kyle Harding on 4/4/16.
//  Copyright © 2016 Sherwin Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCelsius: UITextField!
    @IBOutlet weak var txtFahrenheit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convert(sender: AnyObject) {
        let celcius = txtCelsius.text
        
        let soapMessage = "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><CelsiusToFahrenheit xmlns='http://www.w3schools.com/webservices/'><Celsius>\(celcius)</Celsius></CelsiusToFahrenheit></soap:Body></soap:Envelope>"
        
        let urlString = "http://www.w3schools.com/xml/tempconvert.asmx?op=CelsiusToFahrenheit"
        let url: NSURL = NSURL(string:urlString)!
        let theRequest = NSMutableURLRequest(URL: url)
        
        let msgLength = String(soapMessage.characters.count)
        
        
        theRequest.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        theRequest.addValue("http://www.w3schools.com/xml/CelsiusToFahrenheit", forHTTPHeaderField: "soapAction")
        theRequest.HTTPMethod = "POST"
        theRequest.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(theRequest) { (data, response, error) -> Void in
            
            if let urlContent = data {
                let content = NSString(data: urlContent, encoding: NSUTF8StringEncoding)!
                print(content)
                
            }else{
                print(error)
            }
        }
        
        task.resume()
    }
    
        

    
}

