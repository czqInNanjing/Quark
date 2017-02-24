//
//  TimeTransfer.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/6/1.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import Foundation
/**时间戳转化*/
class TimeTransfer {
    static var formatter = "yyyy年MM月dd日"
    
    static func stringToTimeStamp(_ stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = formatter
        let date = dfmatter.date(from: stringTime)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        print(dateSt)
        return String(dateSt)
        
    }
    
    static func timeStampToString(_ timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = formatter
        
        let date = Date(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from: date))
        return dfmatter.string(from: date)
    }
    
    static func timeStampToStringWithoutYear(_ timeStamp:String) -> String {
        formatter = "MM月dd日"
        return timeStampToString(timeStamp)
    }
}
