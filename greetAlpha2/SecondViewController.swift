//
//  SecondViewController.swift
//  greetAlpha2
//
//  Created by Raizel Lieberman on 12/13/16.
//  Copyright © 2016 MyTech. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SecondViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet var ProfileToMainSwipe: UISwipeGestureRecognizer!
    
    @IBOutlet weak var ProfileToMainButton: UIButton!
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var snapchatAccount: UITextField!
    @IBOutlet weak var instagramAccount: UITextField!
    @IBOutlet weak var twitterAccount: UITextField!
    @IBOutlet weak var skypeAccount: UITextField!
    @IBOutlet weak var linkedinAccount: UITextField!
    
    var accountsTable = UITableView(frame: CGRect(x: 20, y: 20, width: 100, height: 300));
    
    var mediaAccounts = [SocialMedia]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //teal: red: 33.0/255.0, green: 239.0/255.0, blue: 225.0/255.0, alpha: 1.0
        //purple: red: 198.0/255.0, green: 68.0/255.0, blue: 226.0/255.0, alpha: 1.0
        
//        //generic facebook button
//        let facebookLoginButton = FBSDKLoginButton()
//        facebookLoginButton.delegate = self
//        facebookLoginButton.readPermissions = ["email", "public_profile"]
//        view.addSubview(facebookLoginButton)
//        //need to switch to using constraints instead of frames
//        facebookLoginButton.frame = CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 50)
        
        view.addSubview(accountsTable)
        
        
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        background.image = UIImage(named: "Background");
        background.layer.zPosition = -20
        view.addSubview(background)
        
        //custom facebook button
        let facebookCustomLoginButton = UIButton(type: .system)
        facebookCustomLoginButton.setBackgroundImage(#imageLiteral(resourceName: "Facebook Icon"), for: .normal)
        facebookCustomLoginButton.backgroundColor = .blue
        facebookCustomLoginButton.frame = CGRect(x:20, y: view.frame.height - 200, width: 50, height: 50)
        view.addSubview(facebookCustomLoginButton)
        //login when clicked
        facebookCustomLoginButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
        
        
    }
    
    func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self)
        { (result, err) in
            if (err != nil) {
                print("CUSTOM FB LOGIN FAILED", err!)
                return
            }
            
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
                (connection, result, err) in
                
                if (err != nil) {
                    print("Failed graph request:", err!)
                    return
                }
                
                //print(result!) will show all retrieved data
                let fbData:[String:AnyObject] = result as! [String : AnyObject]
                let name = fbData["name"]!
                let facebook = SocialMedia()
                accountNames.addAccount(image: #imageLiteral(resourceName: "Facebook Icon"), name: name as! String)
                //facebook.name = name as! String
                //facebook.medium = "facebook"
                self.mediaAccounts.append(facebook)
                print(self.mediaAccounts)
                
                //ok so at this point we have an array of social media that I think we
                //could print to the phone screen using a table view controller
                
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (error != nil) {
            print("THERE WAS AN ERROR LOGGING IN!!!! HERE IT IS:")
            print(error)
            return
        } else {
            print("logged in to facebook")
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
                (connection, result, err) in
                
                if (err != nil) {
                    print("Failed graph request. Error:");
                    print(err!)
                    return
                }
                
                print(result!)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        accountsTable.reloadData()
    }
    
    @IBAction func addUsername(sender: UITextField)
    {
        accountNames.setValue(1, forKey: snapchatAccount.text!)
        accountNames.setValue(2, forKey: instagramAccount.text!)
        accountNames.setValue(3, forKey: twitterAccount.text!)
        accountNames.setValue(4, forKey: skypeAccount.text!)
        accountNames.setValue(5, forKey: linkedinAccount.text!)
        self.view.endEditing(true)
    }
    
    //iOS Touch Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        accountNames.setValue(1, forKey: snapchatAccount.text!)
        accountNames.setValue(2, forKey: instagramAccount.text!)
        accountNames.setValue(3, forKey: twitterAccount.text!)
        accountNames.setValue(4, forKey: skypeAccount.text!)
        accountNames.setValue(5, forKey: linkedinAccount.text!)
        self.view.endEditing(true)
    }// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    
    //https://forums.developer.apple.com/thread/17801

}

