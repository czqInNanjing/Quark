//
//  HttpConstants.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/28.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON




class HttpStaticHelper{
    static func checkIfStatusOK(json:JSON) -> Bool{
        return json[HttpConstants.status].intValue == 1
    }
    
    static func checkIfValueExist(json:JSON , value:String) -> Bool{
        return json[value].stringValue != "null"
    }
}
struct HttpAPI{
    static let prefix = "http://115.159.160.18:3000"
    static let tokenHeader = "x-access-token"
    static let api_login = prefix + "/api/account/login?"
    static let api_regist = prefix + "/api/account/register?"
    static let api_regist_invite = prefix + "/api/account/register/invite"
    static let api_getQuestionList =  prefix + "/api/question/list/ask?"
    static let api_getQuestionDetail = prefix + "/api/question/detail"
    static let api_getAnswerList = prefix + "/api/question/list/answer"
    static let api_addQuestion = prefix+"/api/question/add"
    static let api_addAnswer = prefix+"/api/answer/add"
    static let api_addComment = prefix + "/api/answer/comment"
    static let api_answerDetail = prefix + "/api/answer/detail"
    static let apiGetCommentList = prefix + "/api/comment/list"
    static let api_focus = prefix + "/api/question/focus"
    static let api_praise = prefix + "/api/answer/praise"
    static let api_down = prefix + "/api/answer/down"
    static let api_collect = prefix + "/api/answer/collect"
    static let api_userDetail=prefix+"/api/user/detail"
    static let api_userFollowee=prefix+"/api/user/followee?"
    static let api_userFollower=prefix+"/api/user/follower?"
    static let api_getImageToken = prefix + "/api/img/token"
    
}


struct HttpConstants{
    static let status = "status"
    static let statusOK = 1
    static let statusNotOK = 0
    
    static let message = "message"
    static let page = "page"
    
    static let user = "user"
    static let writer = "writer"
    
    static let questionId = "question_id"
    static let answerPage = "answer_page"
    static let answerResult = "answers"
    static let answerId = "answer_id"
    static let account_id="account_id"
    
    static let token="token"
    
    static let id="id"
    
    static let editSuccess="修改成功"
    
}






