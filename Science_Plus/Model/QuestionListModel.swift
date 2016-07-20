//
//  QuestionListModel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/21.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON
class QuestionListModel {
    
    private var currentPage = 1
    private var questions = [Array<Question>]()
    func getQuestionsByPage(questionTable qtable:QuestionViewController? )  {
        
        
        
        HttpHandler.httpGET(HttpAPI.api_getQuestionList , parameters: [HttpConstants.page : currentPage]  ){ [weak self] json in
            
//            print("JSON: \(json)")
            if HttpStaticHelper.checkIfStatusOK(json){
                var newQuestions = [Question]()
                for (_,subJson):(String, JSON) in json[HttpConstants.message] {
                    newQuestions.append(Question.makeSimpleQuestion(subJson))
                }
                if newQuestions.count > 1{
                    self?.questions.append(newQuestions)
                    qtable?.table.reloadData()
                    self?.currentPage += 1
                }
            }else{
                print("Question ErrorReason: \(json)")
                //handler(json)
                
            }
            // stop the indicator animation
            qtable?.table.finishInfiniteScroll()
            qtable?.table.dg_stopLoading()
            
        }
        print("current question page:\(currentPage)")
        
        
        
    }
    /**Refresh data, execute when pull to refresh*/
    func refreshData(questionTable qtable:QuestionViewController?) {
        questions.removeAll()
        currentPage = 1
        getQuestionsByPage(questionTable: qtable)
        
        
    }
    
    
    
    
    
    
    func getCurrentPage() -> Int {
        return currentPage
    }
    func getQuestions() -> [Array<Question>] {
        return questions
    }
    
}


