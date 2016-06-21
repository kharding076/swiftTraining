//
//  ViewController.swift
//  Segues
//
//  Created by Kyle Harding on 8/27/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var lblOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.txtInput.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(sender: AnyObject) {
        let st = txtInput.text
        lblOutput.text = st
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        return true
    }
}

