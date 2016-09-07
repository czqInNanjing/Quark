//
//  PersonalTableViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class PersonalTableViewController: UITableViewController {
    
    @IBOutlet var nameL: UILabel!
    @IBOutlet var introduction:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet weak var upNumber: UILabel!
    @IBOutlet weak var fansNumber: UILabel!
    @IBOutlet weak var focusNumber: UILabel!
    
    private var model=PersonShowModel()
    
    private struct storyboard{
        static let showFocus="showFocus"
        static let showFans="showFans"
        static let showArea="showArea"
        static let showUp="showUp"
        static let showFocusQuestion="showFocusQuestion"
        static let showQuery="showQuery"
        static let showAnswerQuestion="showAnswerQuestion"
        static let showPersonDetail="showPersonDetail"
        static var user_id=3
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getPersonInfo(storyboard.user_id,controller: self)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        model.getPersonInfo(storyboard.user_id,controller: self)
        if let parent = self.parentViewController as? UINavigationController{
            if let main = parent.parentViewController as? UITabBarController{
                main.tabBar.hidden = false
            }
        }
    }
    
    static func setUserId(id:Int){
        storyboard.user_id=id
    }
    
    func showPersonInfo(person:Person){
        nameL.text=person.name
        introduction.text=person.introduction
        upNumber.text=String(person.numberOfUp)
        focusNumber.text=String(person.numberOfFocus)
        fansNumber.text=String(person.numberOfFans)
        
    }
    func downloadImage(url: URL){
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data where error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                print(response?.suggestedFilename ?? url.lastPathComponent ?? "")
                print("Download Finished")
                self.imageView.image = UIImage(data: data)
            }
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //        navigationItem.backBarButtonItem=UIBarButtonItem(title: "", style:
        //            .Plain, target: nil, action: nil)
        
        if let identifier = segue.identifier{
            switch identifier {
            case storyboard.showUp:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="赞我的人"
                }
            case storyboard.showFocus:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="我关注的人"
                }
            case storyboard.showFans:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="关注我的人"
                }
            case storyboard.showArea:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="我关注的领域"
                }
            case storyboard.showFocusQuestion:
                if let showFocusViewController = segue.destinationViewController as? FocusQuestionTableViewController{
                    showFocusViewController.title="我关注的问题"
                }
            case storyboard.showQuery:
                if let showFocusViewController = segue.destinationViewController as? FocusQuestionTableViewController{
                    showFocusViewController.title="我提出的问题"
                }
            case storyboard.showAnswerQuestion:
                if let showFocusViewController = segue.destinationViewController as? MyAnswerTableViewController{
                    showFocusViewController.title="我回答的问题"
                }
            case storyboard.showPersonDetail:
                if let parent = self.parentViewController as? UINavigationController{
                    if let main = parent.parentViewController as? UITabBarController{
                        main.tabBar.hidden = true
                    }
                }
                if let showDetailController = segue.destinationViewController as? PersonDetailTableViewController{
                    showDetailController.title=nameL.text
                    PersonDetailTableViewController.setUserId(storyboard.user_id)
                }
            default:
                break
            }
        }
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 7
    //    }
    
    /*
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
