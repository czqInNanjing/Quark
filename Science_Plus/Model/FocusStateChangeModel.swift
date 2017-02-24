//
//  FocusStateChangeModel.swift
//  Science_Plus
//
//  Created by Mac on 16/6/4.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation

class FocusStateChangeModel{
    fileprivate var question_id=0
    fileprivate var isFocused=true
    
    func changeFocusState(_ question_id:Int,isFocused:Bool){
        self.isFocused = isFocused
        self.question_id = question_id
        
        if(self.isFocused){
            HttpHandler.httpDelete(HttpAPI.api_focus, parameters: ["question_id" : self.question_id]){
                json in
                print(json)
            }
        }
        else{
            HttpHandler.httpPost(HttpAPI.api_focus, parameters: ["question_id" : self.question_id]){
                json in
                print(json)
            }
        }
    }
    
}


