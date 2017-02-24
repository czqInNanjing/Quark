//
//  NotificationTableViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    
    
    
    
    
    var names = [String](repeating: "蒋易成", count: 30)
    var questuins = [String](repeating: "如何成为人生赢家", count: 30)
    
    var titles = [String](repeating: "话费充值提醒", count: 30)
    
    var notifications = [String](repeating: "您的话费余额已不足，请尽快充值 。 。  。 。。 您的话费余额已不足，请尽快充值 。 。  。 。。您的话费余额已不足，请尽快充值 。 。  。 。。您的话费余额已不足，请尽快充值 。 。  。 。。您的话费余额已不足，请尽快充值 。 。  。 。。", count: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load notification table view")
        self.hidesBottomBarWhenPushed = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count + titles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticAnswerTableViewCell", for: indexPath) as! NoticAnswerTableViewCell
            cell.nameL.text = names[indexPath.row/2]
            cell.nameL.textColor=UIColor(red: 131/255, green: 163/255, blue: 186/255, alpha: 1)
            
            cell.contentL.text = questuins[indexPath.row/2]
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticOtherTableViewCell", for: indexPath) as! NoticOtherTableViewCell
            cell.titleL.text = titles[indexPath.row/2]
            cell.contentL.text = notifications[indexPath.row/2]
            
            return cell
        }
        
        
        
        
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showMessageDetail" {
           let detailController:MessageDetailViewController = segue.destination as! MessageDetailViewController
            if let messageCell:NoticOtherTableViewCell = sender as? NoticOtherTableViewCell {
//                print("it's  a segue from message")
//                print(messageCell.contentL.text)
//                print(messageCell.titleL.text)
                //注意，这里不能使用Lable，因为此时label还没有加载出来
                detailController.titleOfMessage = messageCell.titleL.text
                detailController.content = messageCell.contentL.text
            }
            
            
        } else if segue.identifier == "showQuestion" {  //跳转至问题界面
            
            
        }
        
        
    }
    

}
