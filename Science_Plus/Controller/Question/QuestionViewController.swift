//
//  QuestionViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//问题列表页
class QuestionViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    private var searchController:UISearchController!
    
    private var showController=SearchViewController()
    
    private struct storyboard {
        static let questionCell = "QuestionCell"
        static let questionDetail =  "showQuestionDetail"
        static let search = "showSearch"
    }
    
    
    
    @IBOutlet var table:UITableView!
    
    
    private var questionModel = QuestionListModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchController=UISearchController(searchResultsController: nil)
        searchController.searchBar.searchBarStyle = .Minimal
        searchController.searchBar.sizeToFit()
        searchController.dimsBackgroundDuringPresentation=false
        
        searchController.searchResultsUpdater = showController
        //点击searchBar跳转到另一个页面
        searchController.searchBar.delegate = showController
        
        table.tableHeaderView=searchController.searchBar
        
        
//        searchController.searchBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "viewTap"))
        
        questionModel.getQuestionsByPage(questionTable:self)
        
//        if searchController.active {
//            print("sssssss")
//        }
        
        
        table.addInfititeScroll {[weak self] (scrollView) -> Void in
            self?.questionModel.getQuestionsByPage(questionTable:self)
        }
        table.addPullToRefresh
            { [weak self] () -> Void in
                self?.questionModel.refreshData(questionTable: self)
        }
        
        
    }
    
    func viewTap(sender: UITapGestureRecognizer){
        print("clicked")
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBar.hidden=false
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return questionModel.getQuestions().count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionModel.getQuestions()[section].count
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier(storyboard.questionCell, forIndexPath: indexPath) as! QuestionTableViewCell
        let questions = questionModel.getQuestions()
        cell.question = questions[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.parentViewController!.parentViewController!.performSegueWithIdentifier(storyboard.questionDetail, sender: questionModel.getQuestions()[indexPath.section][indexPath.row])
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == storyboard.search {
            print(self.parentViewController)
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
            
        }
    }
    
    
    //    func loadNewData(){
    //        print("Loading new data  . . . ")
    //
    //        questionModel.getQuestionsByPage(questionTable:self)
    //    }
    
    
    
    //
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == storyboard.questionDetail {
    //            if let indexPath = table.indexPathForSelectedRow {
    //                let naController = segue.destinationViewController as!
    //                UINavigationController
    //                if let questionDetailController = naController.visibleViewController as? QAnswerViewController {
    //                    questionDetailController.title="6月6日创建"//未实现
    //                    questionDetailController.question = questionModel.getQuestions()[indexPath.section][indexPath.row]
    //                    }
    //            }
    //        }
    //    }
    
}
