//
//  MessageViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    
    @IBOutlet weak var agreeView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var letterView: UIView!
    @IBOutlet weak var SegementController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        notificationView.hidden = false
        letterView.hidden = true
        agreeView.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch SegementController.selectedSegmentIndex
        {
        case 0:
            notificationView.hidden = false
            letterView.hidden = true
            agreeView.hidden = true
            
        case 1:
            agreeView.hidden = false

            notificationView.hidden = true
            letterView.hidden = true
        case 2:
            letterView.hidden = false
            notificationView.hidden = true
            agreeView.hidden = true
            
            
            
        
        default:
            break
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
