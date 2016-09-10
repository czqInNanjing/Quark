//
//  TestQiniu.swift
//  Science_Plus
//
//  Created by Qiang Chen on 7/24/16.
//  Copyright © 2016 Chem_Plus. All rights reserved.
//

import Foundation
import Qiniu

/**Deal with probelms about the upload and download process about QiniuSDK*/
import SwiftyJSON
class QiniuSDK : NSObject{
    
    static let qnUploadManager:QNUploadManager = QNUploadManager()
    
    /**get the image of the user*/
    static func getUserImage(complete:() -> Void) {
        
        
        
    }
    
    
    
    static func upload(data:NSData?, name:String) {

        

        
        
        let bucket = "bucket"
        let key = "key"
        
        
        /**
         *    上传完成后的回调函数
         *
         *    @param info 上下文信息，包括状态码，错误值
         *    @param key  上传时指定的key，原样返回
         *    @param resp 上传成功会返回文件信息，失败为nil; 可以通过此值是否为nil 判断上传结果
         */
        HttpHandler.httpGET(HttpAPI.api_getImageToken , parameters: [bucket:HttpConstants.qiniuBucketName , key : name] ){json in
            print("name \(name)")
            
            if HttpStaticHelper.checkIfStatusOK(json){
                let imageToken = json[HttpConstants.message]["token"].stringValue

                print(json)
                print(imageToken)
                qnUploadManager.putData(data,
                                        key:  name,
                                        token: imageToken,
                                        complete: { (responseInfo, keyImageName, res) in
                                            if(!responseInfo.broken){
                                                    print(responseInfo.statusCode)
                                                    print(responseInfo.description)
                                                    if(res == nil){
                                                        print("Upload Fail")
                                                    }else{
                                                        print("文件数量")
                                                        for pair in res {
                                                            print(pair)
                                                        }
                                                        
                                                        
                                                    }
                                                    
                                                    
                                                
                                                
                                                
                                                
                                            } else {
                                                print("Net work error")
                                            }
                    },
                                        option: nil)
            }else{
                print("Get Image Token ErrorReason: \(json)")
                //handler(json)
                
            }
            // stop the indicator animation
            
            
            
        }
        
        
        
        
    }

    

    }


