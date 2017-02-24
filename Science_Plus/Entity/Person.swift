//
//  Person.swift
//  Science_Plus
//
//  Created by Mac on 16/7/28.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

//"status": 1,
//"error_code": null,
//"message": {
//    "id": 1,
//    "img_url": "test.png",
//    "name": "小春",
//    "introduction": "小楼昨夜听风雨",
//    "gender": 0,
//    "unit": "中国科学院",
//    "education": "南京大学%博士",
//    "work": "中国科学院%教授",
//    "residence": "江苏$南京",
//    "major": "物理学院",
//    "profession": 0,
//    "create_time": 13213216516
//}

import Foundation
import SwiftyJSON

class Person{
    var id=0
    var img_url=""
    var name=""
    var introduction=""
    var gender=0
    var unit=""
    var education=""
    var work=""
    var residence=""
    var major=""
    var profession=0
    var create_time=""
    var numberOfFans=0
    var numberOfFocus=0
    var numberOfUp=0
    
    init(){
        
    }
    
    static func makeSimplePerson(_ json:JSON) -> Person {
        let person=Person()
        person.id=json["id"].intValue
        person.name=json["name"].stringValue
        person.img_url = json["img_url"].stringValue
        person.introduction=json["introduction"].stringValue
        person.numberOfUp=json["praised_sum"].intValue
        person.numberOfFans=json["follower_sum"].intValue
        person.numberOfFocus=json["followee_sum"].intValue
        
        return person
    }
    
    static func makeFullPerson(_ json:JSON) ->Person {
        let person=Person()
        person.id=json["id"].intValue
        person.name=json["name"].stringValue
        person.introduction=json["introduction"].stringValue
        person.gender=json["gender"].intValue
        person.unit=json["unit"].stringValue
        person.education=json["education"].stringValue
        person.work=json["work"].stringValue
        person.residence=json["residence"].stringValue
        person.major=json["major"].stringValue
        person.profession=json["profession"].intValue
        person.create_time=json["create_time"].stringValue
        person.img_url = json["img_url"].stringValue

        person.numberOfUp=json["praised_sum"].intValue
        person.numberOfFans=json["follower_sum"].intValue
        person.numberOfFocus=json["followee_sum"].intValue
        
        return person
    }
}
