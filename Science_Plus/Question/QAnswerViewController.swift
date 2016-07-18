//
//  QAnswerViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/8.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit
/**问题详情页*/
class QAnswerViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet var myTopicScrollView: UIScrollView!
    @IBOutlet var titleBar: UINavigationItem!
    @IBOutlet weak var questionTitleLabel:UILabel!
    @IBOutlet weak var questionContentLabel:UILabel!
    @IBOutlet weak var focusNumber:UILabel!
    @IBOutlet weak var answerNumber:UILabel!
    @IBOutlet weak var focusButton:UIButton!
    @IBOutlet weak var answerButton:UIButton!
    @IBOutlet weak var table:UITableView!
//    @IBOutlet weak var tableViewToTitleConstraint:NSLayoutConstraint!
    @IBOutlet weak var tableViewToButtonConstraint:NSLayoutConstraint!
    
    private var totalDistance=15.0+74.0
    
    private struct storyBoard{
        static let qAnswerCell = "QAnswerCell"
        static let showAnswerDetail = "showAnswerDetail"
        static let focusNum = "人关注"
        static let answerNum = "人回答"
        static let bulidTime = "创建"
        static let answerTheQuestion="addAnswer"
    }
    
    private var questionDetailModel = QuestionDetailModel()
    private var focusStateChangeModel = FocusStateChangeModel()
    
    var question:Question{
        set{
            questionDetailModel.setQuestion(newValue)
        }
        get {
            return questionDetailModel.question
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let upSwipe = UISwipeGestureRecognizer(target: self, action:#selector(QAnswerViewController.handleSwipes(_:)))
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(QAnswerViewController.handleSwipes(_:)))
        
        upSwipe.direction = .Up
        downSwipe.direction = .Down
        
        
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
    }
    
    override func viewWillAppear(animated: Bool) {
        questionDetailModel.regetQuestionDetail(questionDetailController: self)
//        self.tableViewToTitleConstraint.active=false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return questionDetailModel.getAnswers().count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionDetailModel.getAnswers()[section].count
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Up) {
            tableViewToButtonConstraint.constant-=(CGFloat(totalDistance)+questionContentLabel.frame.height+focusNumber.frame.height+answerButton.frame.height)
        }
        
        if (sender.direction == .Down) {
           tableViewToButtonConstraint.constant+=(CGFloat(totalDistance)+questionContentLabel.frame.height+focusNumber.frame.height+answerButton.frame.height)
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier(storyBoard.qAnswerCell , forIndexPath: indexPath) as! QAnswerTableViewCell
        
        cell.answer = questionDetailModel.getAnswers()[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
    //    func loadData(){
    //        questionDetailModel.getQuestionDetail(questionDetailController: self)
    //    }
    
    func reloadQuestionData(){
        titleBar.title = TimeTransfer.timeStampToStringWithoutYear(question.createTime) + storyBoard.bulidTime
        questionTitleLabel.text=question.title
        questionContentLabel.text=question.content
        focusNumber.text="\(question.focusNum)\(storyBoard.focusNum)"
        answerNumber.text="\(question.answerNum)\(storyBoard.answerNum)"
        MyTopicScrollView.config(myTopicScrollView, topics: question.topics)
    }
    
    @IBAction func focus(){
        print("Focus Button is Clicked!")
        focusStateChangeModel.changeFocusState(question.id, isFocused: focusButton.selected)
        focusButton.selected = !focusButton.selected
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier{
            switch identifier {
            case storyBoard.showAnswerDetail:
                let showAnswerDetailController = segue.destinationViewController as! AnswerDetailViewController
                if let cell = sender as? QAnswerTableViewCell {
                    print("show answer detail \(cell.answerID)")
                    showAnswerDetailController.setAnswer(cell.answer)
                    
                }
            case storyBoard.answerTheQuestion:
                print(question.getId())
                print("QAnswer")
                if let answerTheQuestionController = segue.destinationViewController as?  AnswerTheQuestionViewController{
                    answerTheQuestionController.setQuestionId(question.getId())
                }
            default:
                break
            }
        }
        
        
        
        
        
    }
}
