//
//  RegisterModel.swift
//  Science_Plus
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation

class RegisterModel{
    private var email=""
    private var password=""
    private var inviteCode=""
    
    func register(email:String,password:String,inviteCode:String)->Int{
        self.email=email
        self.password=password
        self.inviteCode=inviteCode
//        return HttpHandler.regist(self.email, passwd: self.password)
        return HttpHandler.regist_invite(self.email, passwd: self.password, inviteCode: self.inviteCode)
    }
}