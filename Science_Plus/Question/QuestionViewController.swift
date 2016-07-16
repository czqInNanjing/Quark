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
    
    private struct storyboard {
        static let questionCell = "QuestionCell"
        static let questionDetail =  "showQuestionDetail"
    }
    
    
    @IBOutlet private var searchBar : UISearchBar!
    @IBOutlet var table:UITableView!
    
    
    /**当前显示的Section Row*/
    private var currentIndex:NSIndexPath?
    
    private var questionModel = QuestionListModel()
    
//    override func viewWillAppear(animated: Bool) {
//        print("view will appear")
//    }
//    override func viewWillDisappear(animated: Bool) {
//        print("view will disappear")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
        questionModel.getQuestionsByPage(questionTable:self)
        
        table.infiniteScrollIndicatorView = CustomTableIndicator(frame: CGRectMake(0, 0, 24, 24))
        table.addInfiniteScrollWithHandler { [weak self] (scrollView) -> Void in
            self?.questionModel.getQuestionsByPage(questionTable:self)
        }
        
        
//         Initialize tableView
//        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
//        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
//        table.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
//            self?.loadNewData()
//            self?.table.dg_stopLoading()
//            }, loadingView: loadingView)
//        table.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
//        table.dg_setPullToRefreshBackgroundColor(table.backgroundColor!)
        
        
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
