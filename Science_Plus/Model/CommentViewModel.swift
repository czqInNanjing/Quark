//
//  CommentViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/27.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class CommentViewModel {
    
    private var answerID:Int?
    
    private var comment = [Array<Comment>]()
    
    private var currentPage = 1
    
    func loadComment(controller: CommentViewController) {
        if let id = answerID{
            HttpHandler.httpGET(HttpAPI.apiGetCommentList, parameters: ["answer_id":id,"page":currentPage] ){[weak self] json in
//                print("comment Data: \(json)")
                if HttpStaticHelper.checkIfStatusOK(json){
                    var newComments = [Comment]()
                    for (_ , subJSON) in json["message"] {
                        newComments.append(Comment.makeComment(subJSON))
                    }
                    if newComments.count > 0{
                        self?.comment.append(newComments)
                        self?.currentPage += 1
                        controller.table.reloadData()
                    }

                }else{
                    print("Status error \(json)")
                }
                
                
            }
        }
        
        
        
    }
    
    
    
    func getComment() -> [Array<Comment>] {
        return comment
    }
    
    
    func setAnswer(id:Int?){
        answerID = id
    }
    func getAnswer() -> Int?{
        return answerID
    }
    
}