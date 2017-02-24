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
    
    fileprivate var totalDistance=15.0+74.0
    
    fileprivate struct storyBoard{
        static let qAnswerCell = "QAnswerCell"
        static let showAnswerDetail = "showAnswerDetail"
        static let focusNum = "人关注"
        static let answerNum = "人回答"
        static let bulidTime = "创建"
        static let answerTheQuestion="addAnswer"
    }
    
    fileprivate var questionDetailModel = QuestionDetailModel()
    fileprivate var focusStateChangeModel = FocusStateChangeModel()
    
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
        
        upSwipe.direction = .up
        downSwipe.direction = .down
        
        
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questionDetailModel.regetQuestionDetail(questionDetailController: self)
//        self.tableViewToTitleConstraint.active=false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return questionDetailModel.getAnswers().count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionDetailModel.getAnswers()[section].count
    }
    
    func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .up) {
            tableViewToButtonConstraint.constant-=(CGFloat(totalDistance)+questionContentLabel.frame.height+focusNumber.frame.height+answerButton.frame.height)
        }
        
        if (sender.direction == .down) {
           tableViewToButtonConstraint.constant+=(CGFloat(totalDistance)+questionContentLabel.frame.height+focusNumber.frame.height+answerButton.frame.height)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: storyBoard.qAnswerCell , for: indexPath) as! QAnswerTableViewCell
        
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
        focusStateChangeModel.changeFocusState(question.id, isFocused: focusButton.isSelected)
        focusButton.isSelected = !focusButton.isSelected
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier{
            switch identifier {
            case storyBoard.showAnswerDetail:
                let showAnswerDetailController = segue.destination as! AnswerDetailViewController
                if let cell = sender as? QAnswerTableViewCell {
                    print("show answer detail \(cell.answerID)")
                    showAnswerDetailController.setAnswer(cell.answer)
                    
                }
            case storyBoard.answerTheQuestion:
                print(question.getId())
                print("QAnswer")
                if let answerTheQuestionController = segue.destination as?  AnswerTheQuestionViewController{
                    answerTheQuestionController.setQuestionId(question.getId())
                }
            default:
                break
            }
        }
        
        
        
        
        
    }
}
