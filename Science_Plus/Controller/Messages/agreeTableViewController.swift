//
//  agreeTableViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/8.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class agreeTableViewController: UITableViewController {
    
    var upnum = [Int](count: 30, repeatedValue: 512)
    
//    var
    var whoups = [String](count: 30, repeatedValue:"蒋易成")
//    var questuins = [String](count: 30, repeatedValue:"如何成为人生赢家")
    
    var titles = [String](count: 30, repeatedValue:"话费充值提醒")
    
    var answers = [String](count: 30, repeatedValue:"您的话费余额已不足，请尽快充值 。 。  。 。。 您的话费余额已不足，请尽快充值 。 。  。 。。您的话费余额已不足，请尽快充值 。 。  。 。。您的话费余额已不足，请尽快充值 。 。  。 。。您的话费余额已不足，请尽快充值 。 。  。 。。")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return upnum.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoticficAgreeCell", forIndexPath: indexPath) as! NoticAgreeTableViewCell
        cell.whoUpLabel.text = whoups[indexPath.row] + "等 \(upnum[indexPath.row])人赞同了回答"
        cell.titleL.text = titles[indexPath.row]
        cell.numofUpL.text = String(upnum[indexPath.row])
        cell.numofUpL.layer.cornerRadius=5.0
        cell.numofUpL.clipsToBounds=true
        cell.answerL.text = answers[indexPath.row]
        
        
        
        // Configure the cell...

        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
