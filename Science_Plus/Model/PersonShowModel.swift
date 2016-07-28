//
//  PersonShowModel.swift
//  Science_Plus
//
//  Created by Mac on 16/7/28.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation


class PersonShowModel {
    private var personInfo=Person()
    
    func getPersonInfo(user_id:Int,controller:PersonalTableViewController){
        if user_id != 0{
            HttpHandler.httpGET(HttpAPI.api_userDetail, parameters: [HttpConstants.account_id:user_id]){[weak self] json in
                if HttpStaticHelper.checkIfStatusOK(json){
                    self!.personInfo=Person.makeSimplePerson(json[HttpConstants.message])
                    controller.showPersonInfo(self!.personInfo)
                }
            }
        }
    }
    
    func getPersonDetailInfo(user_id:Int,controller:PersonDetailTableViewController){
        if user_id != 0{
            HttpHandler.httpGET(HttpAPI.api_userDetail, parameters: [HttpConstants.account_id:user_id]){[weak self] json in
                if HttpStaticHelper.checkIfStatusOK(json){
                    self!.personInfo=Person.makeFullPerson(json[HttpConstants.message])
                    controller.showPersonInfo(self!.personInfo)
                }
            }
        }
    }
    
    func changePersonInfo(person:Person,controller:PersonDetailEditTableViewController){
        HttpHandler.httpPost(HttpAPI.api_userDetail, parameters: ["name":person.name,"introduction":person.introduction]){[weak self] json in
            if HttpStaticHelper.checkIfStatusOK(json){
                controller.noticeSuccess(HttpConstants.editSuccess)
            }
            else{
                controller.noticeError(json["error_code"].stringValue)
            }
        }

    }
}