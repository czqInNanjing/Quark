//
//  QuestionNeedAnswerModel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/28.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON
/**“这些问题需要你的回答“界面Model*/
class QuestionNeedAnswerModel {
    private var currentPage = 1
    private var questions = [Array<Question>]()
    func getQuestionsByPage(questionTable qtable:QuestionNeedAnswerViewController? )  {
        
        
        
        HttpHandler.httpGET(HttpAPI.api_getAnswerList , parameters: [HttpConstants.page : currentPage]  ){ [weak self] json in
            
//                        print("JSON: \(json)")
            if HttpStaticHelper.checkIfStatusOK(json){
                var newQuestions = [Question]()
                for (_,subJson):(String, JSON) in json[HttpConstants.message] {
                    newQuestions.append(Question.makeNeedAnswerQuestion(subJson))
                }
                if newQuestions.count > 1{
                    self?.questions.append(newQuestions)
                    qtable?.table.reloadData()
                    
                }
            }else{
                print("ErrorReason: \(json)")
                //handler(json)
                
            }
            
            qtable?.table.finishInfiniteScroll()
            
        }
        print("current question page:\(currentPage)")
        currentPage += 1
        
        
    }
    
    func refreshData(questionTable qtable:QuestionViewController) {
        
    }
    
    
    
    
    
    
    func getCurrentPage() -> Int {
        return currentPage
    }
    func getQuestions() -> [Array<Question>] {
        return questions
    }

}