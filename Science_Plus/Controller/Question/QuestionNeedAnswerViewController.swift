//
//  QuestionNeedAnswerViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

/**“这些问题需要你的回答“界面Controller*/
class QuestionNeedAnswerViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet var table:UITableView!
    
    private var questionModel = QuestionNeedAnswerModel()

    private struct storyboard {
        static let questionCell = "QuestionNeedAnswerCell"
        static let questionDetail =  "showQuestionDetail"
        static let addAnswer = "addAnswer"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionModel.getQuestionsByPage(questionTable:self)
        
        
        table.addInfititeScroll {[weak self] (scrollView) -> Void in
            self?.questionModel.getQuestionsByPage(questionTable:self)
        }
        table.addPullToRefresh
            { [weak self] () -> Void in
                self?.questionModel.refreshData(questionTable: self)
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBar.hidden=false
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return questionModel.getQuestions().count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionModel.getQuestions()[section].count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier(storyboard.questionCell, forIndexPath: indexPath) as! QuestionNeedAnswerTableViewCell
//        print(indexPath.section)
//        print(indexPath.row)
//        print(questionModel.getQuestions().count)
//        print(questionModel.getQuestions()[0].count)
        cell.question = questionModel.getQuestions()[indexPath.section][indexPath.row]
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.parentViewController!.parentViewController!.performSegueWithIdentifier(storyboard.questionDetail, sender: questionModel.getQuestions()[indexPath.section][indexPath.row])
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == storyboard.addAnswer{
            print("addAnswerFromQuestionNeedAnswer")
            if let parent = self.parentViewController as? UIPageViewController{
                print(parent.parentViewController)
                if let main = parent.parentViewController as? TotalViewController{
                    if let parent2 = main.parentViewController as? UINavigationController{
                        if let main2 = parent2.parentViewController as? UITabBarController{
                            main2.tabBar.hidden = true
                        }
                    }
                }
                
            }
//            segue.destinationViewController.title = "请写下你的回答"
        }
    }







}
