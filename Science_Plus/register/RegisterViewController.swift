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


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dealWithRegister(sender: UIButton){
        registerModel.register(mainField.text!, password: passwordField.text!, inviteCode: inviteCodeField.text!)
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
