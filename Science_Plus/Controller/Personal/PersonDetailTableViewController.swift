//
//  PersonDetailTableViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/7/20.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class PersonDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var introductionL: UILabel!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var numberOfUpL: UILabel!
    @IBOutlet weak var numberOfFocusL: UILabel!
    @IBOutlet weak var numberOfFansL: UILabel!
    
    @IBOutlet weak var provinceL: UILabel!
    @IBOutlet weak var cityL: UILabel!
    @IBOutlet weak var schoolOneL: UILabel!
    @IBOutlet weak var degreeOneL: UILabel!
    @IBOutlet weak var schoolTwoL: UILabel!
    @IBOutlet weak var degreeTwoL: UILabel!
    @IBOutlet weak var workspaceOneL: UILabel!
    @IBOutlet weak var positionOneL: UILabel!
    @IBOutlet weak var workspaceTwoL: UILabel!
    @IBOutlet weak var positionTwoL: UILabel!
    
    fileprivate var model=PersonShowModel()
    
    fileprivate var personInfo=Person()
    
    fileprivate struct storyboard{
        
        static var user_id=1
        static let man="man"
        static let woman="woman"
        static let edit="edit"
        
    }
    
    static func setUserId(_ id:Int){
        storyboard.user_id=id
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model.getPersonDetailInfo(storyboard.user_id,controller: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.getPersonDetailInfo(storyboard.user_id,controller: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //图片没有加
    func showPersonInfo(_ person:Person){
        self.personInfo=person
        print("showPersonInfo")
        nameL.text=person.name
        introductionL.text=person.introduction
        numberOfUpL.text=String(person.numberOfUp)
        numberOfFocusL.text=String(person.numberOfFocus)
        numberOfFansL.text=String(person.numberOfFans)
        let address=person.residence
        if address != ""{
            let fullAddressArr = address.components(separatedBy: "&")
            provinceL.text=fullAddressArr[0]
            cityL.text=fullAddressArr.count>1 ? fullAddressArr[1] : " "
        }
        
        //woman的图片未上传
//        let gender=person.gender == 0 ? storyboard.woman : storyboard.man
//        genderImage=UIImage(named: gender)
        
        let education=person.education
        if education != ""{
            let fullArr = education.components(separatedBy: "%")
            schoolOneL.text=fullArr[0]
            degreeOneL.text=fullArr.count>1 ? fullArr[1] : " "
        }
        
        let work=person.work
        if work != ""{
            let fullArr = work.components(separatedBy: "%")
            workspaceOneL.text=fullArr[0]
            positionOneL.text=fullArr.count>1 ? fullArr[1] : " "
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case storyboard.edit:
                if let editController = segue.destination as? PersonDetailEditTableViewController{
                    editController.person=self.personInfo
                    
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
//        return 0
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
