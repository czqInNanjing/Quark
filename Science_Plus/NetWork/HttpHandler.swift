//
//  HttpHandler.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/18.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
public class HttpHandler {
    
    
    
    static var token:String? = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNDY1MDkzMTc2NTc0fQ.9KV_4QP2mveK8g4I8FKTRYT9zsHnn6UXSYBNQJzkshU"
    
    static let httpInstance = HttpHandler()
    
    
    
    
    private init(){
        print("Initialize the instance of HttpHandler , is in Singleton pattern.\n")
    }
    
    /* 本方法采用默认的GET请求和登录时获得的Token，传入URL , 参数和 获得json后的处理方式即可*/
    static func httpGET(url:String ,parameters:[String : AnyObject] = [:] , handler:(JSON)->Void ){
        if let token = HttpHandler.token{
            Alamofire.request(.GET, url, parameters: parameters, headers: [HttpAPI.tokenHeader : token]).validate().responseJSON{response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        handler(json)
                    }
                    
                case .Failure(let error):
                    print(error)
                }
                
                
            }
            //            Alamofire.request(.GET, url, parameters: parameters, headers: [HttpHandler.api.tokenHeader : token]).validate().response(completionHandler: { (request, response, data, error) in
            //                print(request)
            //                print(response)
            //                print(data)
            //                print(error)
            //            })
        }
    }
    /**本方法采用默认的POST请求和登录时获得的Token，传入URL , 参数和 获得json后的处理方式即可 */
    static func httpPost(url:String ,parameters:[String : AnyObject] , handler:(JSON)->Void ){
        print("post started!")
        if let token=HttpHandler.token{
            Alamofire.request(.POST, url, parameters: parameters,  headers: [HttpAPI.tokenHeader : token]).validate().responseJSON{response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        handler(json)
                    }
                    
                case .Failure(let error):
                    print(error)
                }
                
                
            }
        }
    }
    
    /**本方法采用默认的DELETE请求和登录时获得的Token，传入URL , 参数和 获得json后的处理方式即可 */
    static func httpDelete(url:String ,parameters:[String : AnyObject] , handler:(JSON)->Void ){
        print("delete started!")
        if let token=HttpHandler.token{
            Alamofire.request(.DELETE, url, parameters: parameters, encoding: .JSON, headers: [HttpAPI.tokenHeader : token]).validate().responseJSON{response in
                print(url)
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        handler(json)
                    }
                    
                case .Failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
    static func login(mail:String , passwd:String) ->Bool{
        let urlPath = HttpAPI.api_login + "mail=\(mail)&password=\(passwd)"
        let token = "token"
        //创建NSURL对象
        
        let url:NSURL! = NSURL(string:urlPath)
        //创建请求对象
        let request:NSURLRequest = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        
        let semaphore = dispatch_semaphore_create(0)
        var result = true
        let dataTask = session.dataTaskWithRequest(request,
                                                   completionHandler: {(data, response, error) -> Void in
                                                    if error != nil{
                                                        print(error?.code)
                                                        print(error?.description)
                                                    }else{
                                                        
                                                        let json = JSON(data: data!)
                                                        
                                                        HttpHandler.token = json[token].stringValue
                                                        print(response?.description)
                                                        print(data?.description)
                                                        if HttpHandler.token == "" {
                                                            result = false;
                                                        }
                                                    }
                                                    
                                                    dispatch_semaphore_signal(semaphore)
        }) as NSURLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        return result
    }
    
    static func regist(mail:String , passwd:String) -> Int{
        let urlPath = HttpAPI.api_regist
        var user_id:Int = -1
        Alamofire.request(.POST, urlPath, parameters: ["mail" : mail , "password" : passwd]).validate().responseJSON{ response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if json["status"].intValue == 1 {
                        user_id = json["user_id"].intValue
                    }
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
            
        }
        return user_id
    }
    
    static func regist_invite(mail:String , passwd:String,inviteCode:String) -> Int{
        let urlPath = HttpAPI.api_regist_invite
        var user_id:Int = -1//==-2000,not email;==-2001,mail exist;==-2005,not correct inviteCode
        Alamofire.request(.POST, urlPath, parameters: ["mail" : mail , "password" : passwd]).validate().responseJSON{ response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if json["status"].intValue == 1 {
                        user_id = json["user_id"].intValue
                    }
                    else{
                        user_id = 0 - json["error_code"].intValue
                        print("status 0 user_id  \(user_id)")
                    }
                    print("JSON: \(json)")
                    print("error_code: \(json["error_code"].intValue)")
                }
            case .Failure(let error):
                print(error)
            }
            
        }
        
        print("user_id: \(user_id)")
        return user_id
    }

    
    
}

