//
//  CommentAddedModel.swift
//  Science_Plus
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation

class CommentAddedModel{
    fileprivate var answer_id=0
    fileprivate var comment_content=""
    
    func addComment(_ id:Int ,content:String){
        print("answer id :",id)
        self.comment_content=content
        self.answer_id=id
        HttpHandler.httpPost(HttpAPI.api_addComment, parameters: ["answer_id" : answer_id,"comment_content" : comment_content,"replyee_id":answer_id]){ json in
            print(json)
        }
    }
    
}
