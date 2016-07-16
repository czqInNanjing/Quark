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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func dealWithLogin(sender: UIButton) {
        
        sender.enabled = false
        print("login start")
        if let mail = self.mainField.text {
            if let password = self.passwordField.text{
                
                HttpHandler.httpGET(HttpAPI.api_login, parameters: ["mail":mail , "password":password]) { [weak self] json in
                    let token = json["message"]["token"].stringValue
                    print(json)
                    print(token)
                    if token != ""{
                        HttpHandler.token = token
                    self?.performSegueWithIdentifier("loginSuccess", sender: nil)
                        
                    }
                    self?.loginbutton.enabled = true
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
