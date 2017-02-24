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
    
    fileprivate var questionModel = QuestionNeedAnswerModel()

    fileprivate struct storyboard {
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden=false
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return questionModel.getQuestions().count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionModel.getQuestions()[section].count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: storyboard.questionCell, for: indexPath) as! QuestionNeedAnswerTableViewCell
//        print(indexPath.section)
//        print(indexPath.row)
//        print(questionModel.getQuestions().count)
//        print(questionModel.getQuestions()[0].count)
        cell.question = questionModel.getQuestions()[indexPath.section][indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.parent!.parent!.performSegue(withIdentifier: storyboard.questionDetail, sender: questionModel.getQuestions()[indexPath.section][indexPath.row])
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == storyboard.addAnswer{
            print("addAnswerFromQuestionNeedAnswer")
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
//            segue.destinationViewController.title = "请写下你的回答"
        }
    }







}
