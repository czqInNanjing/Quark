//
//  FieldViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/7/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class FieldViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var fieldImageView: UIImageView!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var fieldDescription: UILabel!
    @IBOutlet weak var numberOfFocus: UILabel!
    @IBOutlet weak var numberOfIn: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    private struct storyboard {
        static let questionCell = "questionCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier(storyboard.questionCell , forIndexPath: indexPath) as! FieldQuestionTableViewCell
        
        return cell
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
