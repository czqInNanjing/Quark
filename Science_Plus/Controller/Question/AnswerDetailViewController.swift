//
//  AnswerDetailViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/9.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

/**回答详情界面*/
class AnswerDetailViewController: UIViewController {
    @IBOutlet var name :UILabel!
    @IBOutlet var introduction:UILabel!
    @IBOutlet var upNumber:UILabel!
    @IBOutlet var content:UILabel!
    @IBOutlet var date:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var upButton:UIButton!
    @IBOutlet var upState:UILabel!
    @IBOutlet var downButton:UIButton!
    @IBOutlet var downState:UILabel!
    @IBOutlet var markButton:UIButton!
    @IBOutlet var markState:UILabel!
    @IBOutlet var commentButton:UIButton!
    @IBOutlet var commentState:UILabel!
    
    fileprivate var answer:Answer?{
        get{
            return answerDetailModel.getAnswer()
        }
        set{
            answerDetailModel.setAnswerID(newValue?.id ?? 0)
        }
    }
    fileprivate var answerDetailModel = AnswerDetailModel()
    fileprivate var answerStateChangeModel = AnswerStateChangeModel()
    
    fileprivate struct storyBoard {
        static let showCommentSegue = "showAnswerComment"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerDetailModel.getAnswerDetail(answerController: self)
        initUI()
    }
    
    fileprivate func initUI(){
        if let answer = self.answer{
            name.text = answer.user.name
            introduction.text = answer.user.introduction
            upNumber.text = "\(answer.praiseNum ?? 0)"
            content.text = answer.content
            date.text = answer.createTime
        }
        
    }
    
    
    @IBAction func UpChangeState (){
        answerStateChangeModel.changeFocusState(answer!.id, isFocused: upButton.isSelected, api: HttpAPI.api_praise)
        
        if(downButton.isSelected){
            answerStateChangeModel.changeFocusState(answer!.id, isFocused: downButton.isSelected, api: HttpAPI.api_down)
            downButton.isSelected = false
            downState.isEnabled = false
            
        }
        
        var tempUpNum = Int(upNumber.text!) ?? 0
        if (upButton.isSelected){
            tempUpNum -= 1
        }else{
            tempUpNum += 1
        }
        
        upNumber.text = String(tempUpNum)
        upButton.isSelected = !upButton.isSelected
        
    }
    
    @IBAction func DownChangeState (){
        answerStateChangeModel.changeFocusState(answer!.id, isFocused: downButton.isSelected, api: HttpAPI.api_down)
        var tempUpNum = Int(upNumber.text!) ?? 0
        if(upButton.isSelected){
            answerStateChangeModel.changeFocusState(answer!.id, isFocused: upButton.isSelected, api: HttpAPI.api_down)
            
            tempUpNum -= 1
            upButton.isSelected = false
            upState.isEnabled = false
        }
        upNumber.text = String(tempUpNum)
        downButton.isSelected = !downButton.isSelected
    }
    
    @IBAction func MarkChangeState(){
        answerStateChangeModel.changeFocusState(answer!.id, isFocused: markButton.isSelected, api: HttpAPI.api_collect)
        markButton.isSelected = !markButton.isSelected
    }
    
    @IBAction func agreeOrNot(){
        upState.isEnabled = !upState.isEnabled
        
    }
    
    @IBAction func helpOrNot(){
        downState.isEnabled = !downState.isEnabled
    }
    
    @IBAction func markOrNot(){
        markState.isEnabled = !markState.isEnabled
    }
    
    func refreshUI()  {
        if let newAnswer = answer {
            upNumber.text = "\(newAnswer.praiseNum)"
            content.text = newAnswer.content
            date.text = TimeTransfer.timeStampToString(newAnswer.createTime)
            
            
            name.text = newAnswer.user.name
            
            introduction.text = newAnswer.user.introduction
            thumbnailImageView.imageFromUrl(newAnswer.user.img_url)
            
            upButton.isSelected = newAnswer.isPraised
            upState.isEnabled = newAnswer.isPraised
            
            downButton.isSelected = newAnswer.isDown
            downState.isEnabled = newAnswer.isDown
            
            markState.isEnabled = newAnswer.isCollected
            markButton.isSelected = newAnswer.isCollected
        }
        
        
        
        
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case storyBoard.showCommentSegue:
                if let commentController = segue.destination as? CommentViewController {
                    print("Show the comment view answerid id \(answer?.id)")
                    commentController.answerID = answer?.id
                    
                }
            default:
                break
            }
        }
        
        
        
    }
    
    func setAnswer(_ answer:Answer?)  {
        self.answer = answer
    }
    
    
}
