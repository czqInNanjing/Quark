//
//  RegisterViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var mainField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var inviteCodeField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private var registerModel=RegisterModel()

    private struct someMessage{
//        static let registerSuccess="registerSuccess"
//        static let mail_exist="该邮箱已被注册"
//        static let bad_mail="邮箱错误"
//        static let bad_invite="邀请码错误"
        //==-2000,not email;==-2001,mail exist;==-2005,not correct inviteCode
        static let showMessages:[Int:String]=[-2000:"邮箱错误",-2001:"该邮箱已被注册",-2005:"邀请码不正确",1:"注册成功"]
        
//        static let successMessage="注册成功"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dealWithRegister(sender: UIButton){
        let code=registerModel.register(mainField.text!, password: passwordField.text!, inviteCode: inviteCodeField.text!)
        var key = 0
        if code > 0{
            key=1
        }
        else{
            key=code
        }
        
        print("key:\(key)    \(code)")
        
        if let message_show=someMessage.showMessages[key]{
            let alertController = UIAlertController(title: message_show, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let delay = 2.0 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            self.presentViewController(alertController, animated: true, completion:nil)
        }
        
        if key == 1{
            let loginController = LoginViewController()
            self.presentViewController(loginController,animated: true, completion:nil)
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
