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
    
    private var answer:Answer?{
        get{
            return answerDetailModel.getAnswer()
        }
        set{
            answerDetailModel.setAnswerID(newValue?.id ?? 0)
        }
    }
    private var answerDetailModel = AnswerDetailModel()
    private var answerStateChangeModel = AnswerStateChangeModel()
    
    private struct storyBoard {
        static let showCommentSegue = "showAnswerComment"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerDetailModel.getAnswerDetail(answerController: self)
        initUI()
    }
    
    private func initUI(){
        if let answer = self.answer{
            name.text = answer.user.name
            introduction.text = answer.user.introduction
            upNumber.text = "\(answer.praiseNum ?? 0)"
            content.text = answer.content
            date.text = answer.createTime
        }
        
    }
    
    
    @IBAction func UpChangeState (){
        answerStateChangeModel.changeFocusState(answer!.id, isFocused: upButton.selected, api: HttpAPI.api_praise)
        
        if(downButton.selected){
            answerStateChangeModel.changeFocusState(answer!.id, isFocused: downButton.selected, api: HttpAPI.api_down)
            downButton.selected = false
            downState.enabled = false
            
        }
        
        var tempUpNum = Int(upNumber.text!) ?? 0
        if (upButton.selected){
            tempUpNum -= 1
        }else{
            tempUpNum += 1
        }
        
        upNumber.text = String(tempUpNum)
        upButton.selected = !upButton.selected
        
    }
    
    @IBAction func DownChangeState (){
        answerStateChangeModel.changeFocusState(answer!.id, isFocused: downButton.selected, api: HttpAPI.api_down)
        var tempUpNum = Int(upNumber.text!) ?? 0
        if(upButton.selected){
            answerStateChangeModel.changeFocusState(answer!.id, isFocused: upButton.selected, api: HttpAPI.api_down)
            
            tempUpNum -= 1
            upButton.selected = false
            upState.enabled = false
        }
        upNumber.text = String(tempUpNum)
        downButton.selected = !downButton.selected
    }
    
    @IBAction func MarkChangeState(){
        answerStateChangeModel.changeFocusState(answer!.id, isFocused: markButton.selected, api: HttpAPI.api_collect)
        markButton.selected = !markButton.selected
    }
    
    @IBAction func agreeOrNot(){
        upState.enabled = !upState.enabled
        
    }
    
    @IBAction func helpOrNot(){
        downState.enabled = !downState.enabled
    }
    
    @IBAction func markOrNot(){
        markState.enabled = !markState.enabled
    }
    
    func refreshUI()  {
        if let newAnswer = answer {
            upNumber.text = "\(newAnswer.praiseNum)"
            content.text = newAnswer.content
            date.text = TimeTransfer.timeStampToString(newAnswer.createTime)
            
            
            name.text = newAnswer.user.name
            
            introduction.text = newAnswer.user.introduction
            thumbnailImageView.image = UIImage(named: newAnswer.user.img_url)
            
            upButton.selected = newAnswer.isPraised
            upState.enabled = newAnswer.isPraised
            
            downButton.selected = newAnswer.isDown
            downState.enabled = newAnswer.isDown
            
            markState.enabled = newAnswer.isCollected
            markButton.selected = newAnswer.isCollected
        }
        
        
        
        
        
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case storyBoard.showCommentSegue:
                if let commentController = segue.destinationViewController as? CommentViewController {
                    print("Show the comment view answerid id \(answer?.id)")
                    commentController.answerID = answer?.id
                    
                }
            default:
                break
            }
        }
        
        
        
    }
    
    func setAnswer(answer:Answer?)  {
        self.answer = answer
    }
    
    
}
