//
//  AnswerAddedModel.swift
//  Science_Plus
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation

class AnswerAddedModel{
    private var question_id=0
    private var answer_content=""

    func addAnswer(id:Int ,content:String){
        self.answer_content=content
        self.question_id=id
        HttpHandler.httpPost(HttpAPI.api_addAnswer, parameters: ["question_id" : question_id,"answer_content" : content]){ json in
        }
    }
    
}