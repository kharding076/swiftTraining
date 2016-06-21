//
//  ViewController.swift
//  Temperature_Computation
//
//  Created by Kyle Harding on 7/21/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, NSURLConnectionDelegate,NSXMLParserDelegate{
    
    var mutableData:NSMutableData = NSMutableData.alloc()
    var currentElementName:NSString = ""

    @IBOutlet weak var txtCelsius: UITextField!
    @IBOutlet weak var txtFahreheit: UITextField!
    
    @IBAction func actionConvert(sender: AnyObject) {
        var celsius = txtCelsius.text
        
        var text = String(format: "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><CelsiusToFahrenheit xmlns='http://www.w3schools.com/webservices/'><Celsius>\(celsius)</Celsius></CelsiusToFahrenheit></soap:Body></soap:Envelope>")
        var soapMessage = text
        
        var urlString = "http://www.w3schools.com/webservices/CelsiusToFahrenheit"
        
        var url: NSURL = NSURL(string: urlString)!
        var theRequest = NSMutableURLRequest(URL: url)
        var msgLength = String(count(soapMessage))
        
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        theRequest.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        theRequest.HTTPMethod = "POST"
        theRequest.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        var connection = NSURLConnection(request: theRequest, delegate: self, startImmediately: true)
        
        if (connection == true){
            var mutableData : Void = NSMutableData.initialize()
        }
    }
    
    func connection(connection: NSURLConnection!, didRecieveResponse response: NSURLResponse!){
        
        mutableData.length = 0
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        mutableData.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        var xmlParser = NSXMLParser(data: mutableData)
        xmlParser.delegate = self
        xmlParser.shouldProcessNamespaces = false
        xmlParser.shouldReportNamespacePrefixes = false
        xmlParser.shouldResolveExternalEntities = false
        xmlParser.parse()
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if currentElementName == "CelsiusToFahrenheitResult" {
            txtFahreheit.text = string
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

