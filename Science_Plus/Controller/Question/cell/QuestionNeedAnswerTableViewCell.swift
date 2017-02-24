//
//  QuestionNeedAnswerTableViewCell.swift
//  Science_Plus
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class QuestionNeedAnswerTableViewCell: UITableViewCell {

    @IBOutlet var myTopicScrollView: UIScrollView!
    @IBOutlet var title:UILabel!
    @IBOutlet var readNumber:UILabel!
    @IBOutlet var focusNumber:UILabel!
    @IBOutlet var answerNumber:UILabel!
//    @IBOutlet var focusButton:UIButton!
    @IBOutlet var answerButton:UIButton!

    var question : Question? {
        didSet{
            updateUI()
        }
    }
    
    fileprivate func updateUI(){
        
        if let nowQuestion = question{
            title.text=nowQuestion.title
            focusNumber.text = nowQuestion.focusNum.str
            answerNumber.text = nowQuestion.answerNum.str
            MyTopicScrollView.config(myTopicScrollView, topics: nowQuestion.topics)
            
        }
        
        
        
        
    }


}
