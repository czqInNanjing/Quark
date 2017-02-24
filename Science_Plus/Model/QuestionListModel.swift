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
    
    fileprivate var currentPage = 1
    fileprivate var questions = [Array<Question>]()
    func getQuestionsByPage(_ isRefresh:Bool = false , questionTable qtable:QuestionViewController? )  {
        
        
        
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
                    if isRefresh{
                        qtable?.noticeSuccess("刷新成功")
                    }else{
//                        qtable?.noticeSuccess("加载成功")
                    }
                    
                }else{
                    if isRefresh{
                        
                    } else{
                        qtable?.noticeInfo("没有更多了")
                    }
                }
            }else{
                print("Question ErrorReason: \(json)")
                //handler(json)
                qtable?.noticeError("网络好像出了点问题")
            }
            // stop the indicator animation
            if isRefresh{
                qtable?.table.dg_stopLoading()
            }else{
                qtable?.table.finishInfiniteScroll()

            }
            
            
        }
        print("current question page:\(currentPage)")
        
        
        
    }
    /**Refresh data, execute when pull to refresh*/
    func refreshData(questionTable qtable:QuestionViewController?) {
        questions.removeAll()
        currentPage = 1
        getQuestionsByPage(true, questionTable: qtable)
        
        
    }
    
    
    
    
    
    
    func getCurrentPage() -> Int {
        return currentPage
    }
    func getQuestions() -> [Array<Question>] {
        return questions
    }
    
}


