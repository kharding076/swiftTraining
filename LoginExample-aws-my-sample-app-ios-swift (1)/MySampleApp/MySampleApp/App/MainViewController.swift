//
//  MainViewController.swift
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

import UIKit
import AWSMobileHubHelper

class MainViewController: UITableViewController {
    
    var demoFeatures: [DemoFeature] = []
    var signInObserver: AnyObject!
    var signOutObserver: AnyObject!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
        // Default theme settings.
        navigationController!.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = UIColor(red: 0xF5/255.0, green: 0x85/255.0, blue: 0x35/255.0, alpha: 1.0)
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()

            presentSignInViewController()
        
        var demoFeature = DemoFeature.init(
            name: NSLocalizedString("User Sign-in",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Enable user login with popular 3rd party providers.",
                comment: "Description for demo menu option."),
            icon: "UserIdentityIcon", storyboard: "UserIdentity")
        
        demoFeatures.append(demoFeature)

                signInObserver = NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignInNotification, object: AWSIdentityManager.defaultIdentityManager(), queue: NSOperationQueue.mainQueue(), usingBlock: {[weak self] (note: NSNotification) -> Void in
                        guard let strongSelf = self else { return }
                        print("Sign In Observer observed sign in.")
                        strongSelf.setupRightBarButtonItem()
                })
                
                signOutObserver = NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignOutNotification, object: AWSIdentityManager.defaultIdentityManager(), queue: NSOperationQueue.mainQueue(), usingBlock: {[weak self](note: NSNotification) -> Void in
                        guard let strongSelf = self else { return }
                        print("Sign Out Observer observed sign out.")
                        strongSelf.setupRightBarButtonItem()
                })
                
                setupRightBarButtonItem()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(signInObserver)
        NSNotificationCenter.defaultCenter().removeObserver(signOutObserver)
    }

    func setupRightBarButtonItem() {
            struct Static {
                static var onceToken: dispatch_once_t = 0
            }
            
            dispatch_once(&Static.onceToken, {() -> Void in
                let loginButton: UIBarButtonItem = UIBarButtonItem(title: nil, style: .Done, target: self, action: nil)
                self.navigationItem.rightBarButtonItem = loginButton
            })
            
            if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
                navigationItem.rightBarButtonItem!.title = NSLocalizedString("Sign-Out", comment: "Label for the logout button.")
                navigationItem.rightBarButtonItem!.action = "handleLogout"
            }
    }
    
    func presentSignInViewController() {
        if !AWSIdentityManager.defaultIdentityManager().loggedIn {
            let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
            let signInViewController = storyboard.instantiateViewControllerWithIdentifier("SignIn") as! SignInViewController
            presentViewController(signInViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - UITableViewController delegates
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainViewCell")!
        let demoFeature = demoFeatures[indexPath.row]
        cell.imageView!.image = UIImage(named: demoFeature.icon)
        cell.textLabel!.text = demoFeature.displayName
        cell.detailTextLabel!.text = demoFeature.detailText
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoFeatures.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let demoFeature = demoFeatures[indexPath.row]
        let storyboard = UIStoryboard(name: demoFeature.storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(demoFeature.storyboard)
        self.navigationController!.pushViewController(viewController, animated: true)
    }

    
    
    func handleLogout() {
        if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
            AWSIdentityManager.defaultIdentityManager().logoutWithCompletionHandler({(result: AnyObject?, error: NSError?) -> Void in
                self.navigationController!.popToRootViewControllerAnimated(false)
                self.setupRightBarButtonItem()
                    self.presentSignInViewController()
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }
    }
}

class FeatureDescriptionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Back", style: .Plain, target: nil, action: nil)
    }
}