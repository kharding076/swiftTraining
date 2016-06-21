//
//  ViewController.swift
//  PizzaXmlParse
//
//  Created by Kyle Harding on 4/6/16.
//  Copyright © 2016 harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate {
    

    @IBOutlet weak var lblOutput: UILabel!
    
    var strXmlData: String = ""
    var currentElement: String = ""
    var passData: Bool = false
    var passName: Bool = false
    var parser: NSXMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func parseData(sender: AnyObject) {
        let url: String = "http://api.androidhive.info/pizza/?format=xml"
        let urlToSend: NSURL = NSURL(string: url)!
        
        parser = NSXMLParser(contentsOfURL: urlToSend)
        parser.delegate = self
        
        let success = parser.parse()
        
        if success{
            print(strXmlData)
        }
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement = elementName
        if(elementName=="id" || elementName=="name" || elementName=="cost" || elementName=="description")
        {
            if(elementName=="name"){
                passName=true;
            }
            passData=true;
        }

    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement="";
        if(elementName=="id" || elementName=="name" || elementName=="cost" || elementName=="description")
        {
            if(elementName=="name"){
                passName=false;
            }
            passData=false;
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if(passName){
            strXmlData=strXmlData+"\n\n"+string
        }
        
        if(passData)
        {
            print(string)
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        NSLog("failure error: %@", parseError)
    }
}

