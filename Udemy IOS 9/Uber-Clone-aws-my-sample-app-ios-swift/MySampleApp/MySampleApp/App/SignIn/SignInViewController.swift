//
//  SignInViewController.swift
//  MySampleApp
//
//
// Copyright 2016 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.1
//
//

import UIKit
import AWSMobileHubHelper

class SignInViewController: UIViewController {
    @IBOutlet weak var anchorView: UIView!

// Support code for Facebook provider UI.
    @IBOutlet weak var facebookButton: UIButton!

// Support code for Google provider UI.
    @IBOutlet weak var googleButton: UIButton!

    @IBOutlet weak var customProviderButton: UIButton!
    @IBOutlet weak var customCreateAccountButton: UIButton!
    @IBOutlet weak var customForgotPasswordButton: UIButton!
    @IBOutlet weak var customUserIdField: UITextField!
    @IBOutlet weak var customPasswordField: UITextField!
    @IBOutlet weak var leftHorizontalBar: UIView!
    @IBOutlet weak var rightHorizontalBar: UIView!
    @IBOutlet weak var orSignInWithLabel: UIView!
    
    
    var didSignInObserver: AnyObject!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("Sign In Loading.")
        
            didSignInObserver =  NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignInNotification,
                object: AWSIdentityManager.defaultIdentityManager(),
                queue: NSOperationQueue.mainQueue(),
                usingBlock: {(note: NSNotification) -> Void in
                    // perform successful login actions here
            })

                facebookButton.removeFromSuperview()
                googleButton.removeFromSuperview()
                // Custom UI Setup
                customProviderButton.addTarget(self, action: "handleCustomLogin", forControlEvents: .TouchUpInside)
                customCreateAccountButton.addTarget(self, action: "handleCustomCreateAccount", forControlEvents: .TouchUpInside)
                customForgotPasswordButton.addTarget(self, action: "handleCustomForgotPassword", forControlEvents: .TouchUpInside)
                customProviderButton.setImage(UIImage(named: "LoginButton"), forState: .Normal)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(didSignInObserver)
    }
    
    func dimissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Utility Methods
    
    func handleLoginWithSignInProvider(signInProvider: AWSSignInProvider) {
        AWSIdentityManager.defaultIdentityManager().loginWithSignInProvider(signInProvider, completionHandler: {(result: AnyObject?, error: NSError?) -> Void in
            // If no error reported by SignInProvider, discard the sign-in view controller.
            if error == nil {
                dispatch_async(dispatch_get_main_queue(),{
                        self.dismissViewControllerAnimated(true, completion: nil)
                })
            }
             print("result = \(result), error = \(error)")
        })
    }

    func showErrorDialog(loginProviderName: String, withError error: NSError) {
         print("\(loginProviderName) failed to sign in w/ error: \(error)")
        let alertController = UIAlertController(title: NSLocalizedString("Sign-in Provider Sign-In Error", comment: "Sign-in error for sign-in failure."), message: NSLocalizedString("\(loginProviderName) failed to sign in w/ error: \(error)", comment: "Sign-in message structure for sign-in failure."), preferredStyle: .Alert)
        let doneAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Label to cancel sign-in failure."), style: .Cancel, handler: nil)
        alertController.addAction(doneAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

    // MARK: - IBActions
    
    func handleCustomLogin() {
        // Handle Login logic for custom sign-in here.
        let alertController = UIAlertController(title: NSLocalizedString("Custom Sign-In Demo", comment: "Label for custom sign-in dialog."), message: NSLocalizedString("This is just a demo of custom sign-in.", comment: "Sign-in message structure for custom sign-in stub."), preferredStyle: .Alert)
        let doneAction = UIAlertAction(title: NSLocalizedString("Done", comment: "Label to complete stubbed custom sign-in."), style: .Cancel, handler: nil)
        alertController.addAction(doneAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func handleCustomCreateAccount() {
        // Handle Create Account action for custom sign-in here.
        let alertController = UIAlertController(title: NSLocalizedString("Custom Sign-In Demo", comment: "Label for custom sign-in dialog."), message: NSLocalizedString("This is just a demo of custom sign-in Create Account Button.", comment: "Sign-in message structure for custom sign-in stub."), preferredStyle: .Alert)
        let doneAction = UIAlertAction(title: NSLocalizedString("Done", comment: "Label to complete stubbed custom sign-in."), style: .Cancel, handler: nil)
        alertController.addAction(doneAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func handleCustomForgotPassword() {
        // Handle Forgot Password action for custom sign-in here.
        let alertController = UIAlertController(title: NSLocalizedString("Custom Sign-In Demo", comment: "Label for custom sign-in dialog."), message: NSLocalizedString("This is just a demo of custom sign-in Forgot Password button.", comment: "Sign-in message structure for custom sign-in stub."), preferredStyle: .Alert)
        let doneAction = UIAlertAction(title: NSLocalizedString("Done", comment: "Label to complete stubbed custom sign-in."), style: .Cancel, handler: nil)
        alertController.addAction(doneAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

    
}
