//
//  Comment.swift
//  Science_Plus
//
//  Created by Mac on 16/5/15.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON


class Comment {
    
    var id:Int
    var answerId:Int
    var answerWriterId:Int
    /**评论者ID*/
    var replyerId:Int
    /**评论者姓名*/
    var replyerName:String
    /**被评论者ID*/
    var replyeeId:Int
    /**被评论者名字*/
    var replyeeName:String
    var imageURL:String
    var createTime:String
    
    var content:String
    
    
    init(id:Int , answerId:Int,answerWriterId:Int,replyerId:Int , replyerName:String ,replyeeId:Int,replyeeName:String, imageURL:String, createTime:String ,content:String){
        self.id = id
        self.answerId = answerId
        self.answerWriterId = answerWriterId
        self.replyerId = replyerId
        self.replyerName = replyerName
        self.replyeeId = replyeeId
        self.replyeeName = replyeeName
        self.imageURL = imageURL
        self.createTime = createTime
        self.content = content
    }
    
    
    static func makeComment(_ json:JSON) -> Comment{
        return Comment(id: json["id"].intValue, answerId: json["answer_id"].intValue, answerWriterId: json["answer_writer"].intValue, replyerId: json["replyer_id"].intValue, replyerName: json["replyer_name"].stringValue, replyeeId: json["replyee_id"].intValue, replyeeName: json["replyee_name"].stringValue, imageURL: json["img_url"].stringValue, createTime: json["create_time"].stringValue, content: json["content"].stringValue)
        
        
        
        
        
        
        
    }
    
    
    
}
