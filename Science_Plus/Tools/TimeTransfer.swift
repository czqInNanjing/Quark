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
    
    static func stringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat = formatter
        let date = dfmatter.dateFromString(stringTime)
        
        let dateStamp:NSTimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        print(dateSt)
        return String(dateSt)
        
    }
    
    static func timeStampToString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:NSTimeInterval = string.doubleValue
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat = formatter
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.stringFromDate(date))
        return dfmatter.stringFromDate(date)
    }
    
    static func timeStampToStringWithoutYear(timeStamp:String) -> String {
        formatter = "MM月dd日"
        return timeStampToString(timeStamp)
    }
}