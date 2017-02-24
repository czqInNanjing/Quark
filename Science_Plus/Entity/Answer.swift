//
//  AnswerModel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/21.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON
class Answer {
    var id:Int = 0
    var content:String = ""
    var praiseNum:Int = 0
    var downNum:Int = 0
    var commentNum:Int = 0
    var collectNum:Int = 0
    var readNum:Int = 0
    var createTime:String = ""
    
    var questionID:Int = 0
    
    var user = Person()
    
    var isCollected = false
    var isDown = false
    var isPraised = false
    
    init(id:Int = 0){
        self.id = id
    }

    
//    func mapping(map: Map) {
//        id  <- map["id"]
//        content <- map["content"]
//        praiseNum  <- map["praise_num"]
//        downNum <- map["down_num"]
//        commentNum  <- map["comment_num"]
//        collectNum <- map["collect_num"]
//        readNum <- map["read_num"]
//        createTime  <- map["create_time"]
//        
//        questionID <- map["question_id"] // TODO
//        
//        userID  <- map["topics"]
//        name <- map["user.name"]
//        introduction  <- map["focus_num"]
//        image <- map["answer_num"]
//        
//        isCollected <- map["bestAnswer"]
//        isDown <- map["answer_num"]
//        isPraised <- map["bestAnswer"]
//    }

    
    
    
    
    static func makeSimpleAnswer(_ json:JSON) -> Answer {
        let answer = Answer()
        
        answer.id = json["id"].intValue
        answer.content = json["content"].stringValue
        answer.praiseNum = json["praise_num"].intValue
        answer.user = Person.makeSimplePerson(json[HttpConstants.user])
        
        return answer
        
    }
    
    static func makeFullAnswer(_ json : JSON) -> Answer{
        let answer = Answer()
//        print("To make answer : \(json)")
        answer.id = json[HttpConstants.message]["id"].intValue
        answer.content = json[HttpConstants.message]["content"].stringValue
        answer.praiseNum = json[HttpConstants.message]["parise_num"].intValue
        answer.downNum = json[HttpConstants.message]["down_num"].intValue
        answer.commentNum = json[HttpConstants.message]["comment_num"].intValue
        answer.collectNum = json[HttpConstants.message]["collect_num"].intValue
        answer.readNum = json[HttpConstants.message]["read_num"].intValue
        answer.createTime = json[HttpConstants.message]["create_time"].stringValue
        
        
        answer.user = Person.makeSimplePerson(json[HttpConstants.message][HttpConstants.writer])
        answer.isCollected = json[HttpConstants.message]["is_collected"].boolValue
        answer.isDown = json[HttpConstants.message]["is_down"].boolValue
        answer.isPraised = json[HttpConstants.message]["is_praised"].boolValue
//        print(answer.isCollected)
//        print(answer.isPraised)
//        print(answer.isDown)
        return answer
    }
    
    
    
    
}
