//
//  QuestionAddedModel.swift
//  Science_Plus
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation

/**问题增加页面model*/
class QuestionAddedModel{
    var title=""
    var content=""
    var tag=[String]()
    
    
    
    func addQuestion(_ title:String ,content:String,tag:[String]){
        self.content=content
        self.tag=tag
        self.title=title
        HttpHandler.httpPost(HttpAPI.api_addQuestion, parameters: ["question_title" : title,"description" : content]){ json in
            print("JSON: \(json)")
        }
    }
}
