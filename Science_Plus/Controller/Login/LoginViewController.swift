//
//  LoginViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/18.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mainField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func testPan(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("Start . . .")
        case .cancelled:
            print("cancel. . .")
        case .ended:
            print("ended")
        case .possible:
            print("possible")
        case .failed:
            print("fail")
        case .changed:
            print("change")
        }
    }

    
    
    @IBAction func dealWithLogin(_ sender: UIButton) {
        
        sender.isEnabled = false
        print("login start")
        if let mail = self.mainField.text {
            if let password = self.passwordField.text{
                
                HttpHandler.httpPost(HttpAPI.api_login, parameters: ["mail":mail , "password":password]) { [weak self] json in
                    let token = json[HttpConstants.message][HttpConstants.token].stringValue
                    let user_id = json[HttpConstants.message][HttpConstants.id].intValue
                    print(json)
                    print(token)
                    if token != ""{
                        HttpHandler.token = token
                        HttpHandler.userID = String(user_id)
                        self?.performSegue(withIdentifier: "loginSuccess", sender: nil)
                        
                    }
                    if user_id != 0{
                        PersonalTableViewController.setUserId(user_id)
                    }
                    self?.loginbutton.isEnabled = true
                }
                
                
                
                
                
                
            }else{
                //please input your password
            }
            
        }else{
            //please input your mail
        }
        
        
        
        
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
