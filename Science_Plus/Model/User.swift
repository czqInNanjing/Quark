//
//  UserModel.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/21.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import SwiftyJSON
class User {
    var id:Int = 0
    var image = ""
    var name = ""
    var introduction = ""
    var gender = true
    var unit = ""
    var education = ""
    var work = ""
    
    init(){
        
    }
    
    static func makeSimpleUser(json:JSON) -> User {
        let user = User()
        user.id = json["id"].intValue
        user.name = json["name"].stringValue
//        user.image = json["img_url"].stringValue
        user.image = SystemConstants.defaultUserImage
        user.introduction = json["introduction"].stringValue
        return user
    }
    
}