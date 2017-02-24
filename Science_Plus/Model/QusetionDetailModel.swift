//
//  QusetionDetailModel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/23.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON

class QuestionDetailModel {
    
    var question:Question = Question(){
        didSet{
            print("question id is set \(question.id)")
            answers.removeAll()
        }
    }
    
    fileprivate var answers:[Array<Answer>] = []
    
    fileprivate var currentPage = 1
    /**用于刷新界面使用*/
    func regetQuestionDetail(questionDetailController qController : QAnswerViewController?)  {
        currentPage = 1
        answers.removeAll()
        getQuestionDetail(questionDetailController: qController)
    }
    /**用于不断下拉加载新的答案使用*/
    func getQuestionDetail(questionDetailController qController : QAnswerViewController?){
        HttpHandler.httpGET(HttpAPI.api_getQuestionDetail ,parameters: [HttpConstants.questionId : question.id ,HttpConstants.answerPage : currentPage]){ [weak self] json in
//            print("question id : \(self?.question.id)")
//            print("JSON: \(json)")
            if HttpStaticHelper.checkIfStatusOK(json){
                if self?.currentPage == 1 {
                    self?.question = Question.makeFullQuestion(json[HttpConstants.message])
                    qController?.reloadQuestionData()
                    
                }
                
                var newAnswers = [Answer]()
                for (_ , subJSON) in json[HttpConstants.message][HttpConstants.answerResult] {
//                    print("subJSON \(subJSON)")
                    newAnswers.append(Answer.makeSimpleAnswer(subJSON))
                }
                if newAnswers.count > 0{
                    self?.answers.append(newAnswers)
                    qController?.table.reloadData()
                    self?.currentPage += 1
                }
            }else{
                print("ERROR JSON: \(json)")
            }
            qController?.table.finishInfiniteScroll()
        }

        print("current answer page:\(currentPage)")
        
    }
    
    
    

    
    func getCurrentPage() -> Int {
        return currentPage
    }
    func getAnswers() -> [Array<Answer>] {
        return answers
    }
    func setQuestion(_ question:Question) {
        self.question = question
    }
    
    
}
