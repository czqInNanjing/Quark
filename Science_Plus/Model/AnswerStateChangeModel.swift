//
//  AnswerStateChangeModel.swift
//  Science_Plus
//
//  Created by Mac on 16/6/4.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation

class AnswerStateChangeModel{
    private var answer_id=0
    private var isTrue=true
    private var api=""
    
    func changeFocusState(answer_id:Int,isFocused:Bool,api:String){
        self.isTrue = isFocused
        self.answer_id = answer_id
        print(answer_id)
        self.api=api
        
        if(self.isTrue){
            HttpHandler.httpDelete(self.api, parameters: ["answer_id" : self.answer_id]){
                json in
                print(json)
            }
        }
        else{
            HttpHandler.httpPost(self.api, parameters: ["answer_id" : self.answer_id]){
                json in
                print(json)
            }
        }
    }
}