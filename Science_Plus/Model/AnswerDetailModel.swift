//
//  AnswerDetailModel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
//答案详情界面Model
class AnswerDetailModel {
    
    fileprivate var answer:Answer?
    
    func getAnswerDetail (answerController controller:AnswerDetailViewController) {
        print("answer id is \(answer?.id)" )
        
        if let id = answer?.id{
            
            HttpHandler.httpGET(HttpAPI.api_answerDetail , parameters: [HttpConstants.answerId: id]){[weak self] json in
                                print("Answer Detail \(json)")
                if HttpStaticHelper.checkIfStatusOK(json){
                    self?.answer = Answer.makeFullAnswer(json)
//                    print("answer : \(self?.answer?.content)")
                    //Answer.makeAnswer(json)
                    controller.refreshUI()
                }else{
                    print("ERROR JSON: \(json)")
                }
                
                
                
                
            }
        }
        
        
        
        
    }
    
    func setAnswerID(_ id:Int){
        self.answer = Answer(id:id)
    }
    
    func getAnswer() -> Answer? {
        return self.answer
    }
}
