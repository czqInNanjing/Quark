//
//  CommentViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/15.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    private var model = CommentViewModel()
    
    var answerID:Int?{
        get{
            return model.getAnswer()
        }
        set{
            model.setAnswer(newValue)
        }
    }
    
    private struct storyBoard{
        static let commentCell = "CommentCell"
        static let addComment="addComment"
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(true)
//        self.table
        model.loadComment(self)
//        self.table.reloadData()
        print("comment add ............")

    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        model.loadComment(self)
//        self.table.reloadData()
//        // Do any additional setup after loading the view.
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return model.getComment().count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getComment()[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(storyBoard.commentCell, forIndexPath: indexPath) as! CommentTableViewCell
        

        cell.comment = model.getComment()[indexPath.section][indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case storyBoard.addComment:
                if let addCommentViewController=segue.destinationViewController as? AddCommentViewController{
                    if let id = answerID{
                        addCommentViewController.setAnswerId(id)
                    }
                }
            default:
                break
            }
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
