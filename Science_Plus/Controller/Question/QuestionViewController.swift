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
    
    fileprivate var searchController:UISearchController!
    
    fileprivate var showController=SearchViewController()
    
    fileprivate struct storyboard {
        static let questionCell = "QuestionCell"
        static let questionDetail =  "showQuestionDetail"
        static let search = "showSearch"
    }
    
    
    
    @IBOutlet var table:UITableView!
    
    
    fileprivate var questionModel = QuestionListModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchController=UISearchController(searchResultsController: nil)
        searchController.searchBar.searchBarStyle = .minimal
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
    
    func viewTap(_ sender: UITapGestureRecognizer){
        print("clicked")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden=false
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return questionModel.getQuestions().count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionModel.getQuestions()[section].count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: storyboard.questionCell, for: indexPath) as! QuestionTableViewCell
        let questions = questionModel.getQuestions()
        cell.question = questions[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.parent!.parent!.performSegue(withIdentifier: storyboard.questionDetail, sender: questionModel.getQuestions()[indexPath.section][indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == storyboard.search {
            print(self.parent)
            if let parent = self.parent as? UIPageViewController{
                print(parent.parent)
                if let main = parent.parent as? TotalViewController{
                    if let parent2 = main.parent as? UINavigationController{
                        if let main2 = parent2.parent as? UITabBarController{
                            main2.tabBar.isHidden = true
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
