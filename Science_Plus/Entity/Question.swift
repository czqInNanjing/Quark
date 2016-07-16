//
//  Question.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/23.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON
class Question {
    var id = 0
    var title = ""
    var topics:Array<String> = []
    var content:String?
    var answerNum = 0
    var focusNum = 0
    var bestAnswer:Answer?
    var isFocused = false
    var createTime = ""
//    
//    required init?(_ map: Map) {
//    }
//    
//    func mapping(map: Map) {
//        id  <- map["id"]
//        title <- map["title"]
//        topics  <- map["topics"]
//        content <- map["content"]
//        focusNum  <- map["focus_num"]
//        answerNum <- map["answer_num"]
//        bestAnswer <- map["bestAnswer"]
//    }
    
    init(){
    }
    
    static func makeSimpleQuestion(json:JSON) -> Question {
        let question = Question()
        
        question.id = json["id"].intValue
        question.title = json["title"].stringValue
        question.topics = json["topics"].arrayObject as! [String]
        if HttpStaticHelper.checkIfValueExist(json, value: "bestAnswer") {
            question.bestAnswer = Answer.makeSimpleAnswer(json["bestAnswer"])
        }
        return question
        
        
        
    }
    
    static func makeNeedAnswerQuestion( json:JSON) -> Question{
        let question = Question()
        
        question.id = json["id"].intValue
        question.title = json["title"].stringValue
        question.topics = json["topics"].arrayObject as! [String]
        question.focusNum = json["focus_num"].intValue
        question.answerNum = json["answer_num"].intValue
        return question
    }
    
    //    static func makeFullQuestion(json:JSON , question:Question) -> Question{
    //
    //    }
    
    static func makeFullQuestion(json:JSON) -> Question{
        let question = Question()
        question.id = json["id"].intValue
        question.title = json["title"].stringValue
        question.topics = json["topics"].arrayObject as! [String]
        question.content = json["content"].stringValue
        question.focusNum = json["focus_num"].intValue
        question.answerNum = json["answer_num"].intValue
        question.isFocused = json["is_focused"].boolValue
        question.createTime = json["create_time"].stringValue 
        if HttpStaticHelper.checkIfValueExist(json, value: "bestAnswer") {
            question.bestAnswer = Answer.makeSimpleAnswer(json["bestAnswer"])
        }
        
        return question
    }
    
    func getId()->Int{
        return id
    }
    
    
    
    
    
}