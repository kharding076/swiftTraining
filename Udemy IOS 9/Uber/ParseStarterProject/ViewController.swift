//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var `riderOrDriver`: UISwitch!
    @IBOutlet weak var toggleSignupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.txtUserName.delegate = self
        self.txtPassword.delegate = self
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(sender: AnyObject) {
        let userName = txtUserName.text
        let password = txtPassword.text
        let isDriver = riderOrDriver.on
        if userName == "" || password == "" {
            
            displayAlert("Missing Field(s)",message: "Username and password are required")

        }else{
            let user = PFUser()
            user.username = userName
            user.password = password
            user["isDriver"] = isDriver
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    if let errorString = error.userInfo["error"] as? NSString {
                        self.displayAlert("Signup Failed", message: errorString as String )
                    }
                } else {
                    print("Hooray! Let them use the app now.")
                }
            }
        }
        
    }
    
    func displayAlert(title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
    
    self.presentViewController(alert, animated: true, completion: nil)
    
    }
    
    
    @IBAction func toggleSignup(sender: AnyObject) {
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        self.view.endEditing(true)
        return false
    }
    
    
}

