//
//  TimeHelper.swift
//  Science_Plus
//
//  Created by Qiang Chen on 9/7/16.
//  Copyright © 2016 Chem_Plus. All rights reserved.
//

import Foundation

class MyDate {
    
    var year:Int
    var month:Int
    var day:Int
    var hour:Int
    var minute:Int
    var second:Int
    
    static func getContemporaryTime () -> String {
        let date = MyDate()
        return "\(date.year)\(date.month)\(date.day)\(date.hour)\(date.minute)\(date.second)"
    }
    
    init (){
        // get the current date and time
        let currentDateTime = NSDate()
        
        // get the user's calendar
        let userCalendar = NSCalendar.currentCalendar()
        
        // choose which date and time components are needed
        let requestedComponents: NSCalendarUnit = [
            NSCalendarUnit.Year,
            NSCalendarUnit.Month,
            NSCalendarUnit.Day,
            NSCalendarUnit.Hour,
            NSCalendarUnit.Minute,
            NSCalendarUnit.Second
        ]
        
        // get the components
        let dateTimeComponents = userCalendar.components(requestedComponents, fromDate: currentDateTime)
        
        // now the components are available
        year = dateTimeComponents.year   // 2015
        month = dateTimeComponents.month  // 10
        day = dateTimeComponents.day    // 26
        hour = dateTimeComponents.hour   // 17
        minute = dateTimeComponents.minute // 41
        second = dateTimeComponents.second // 57
    }
    
}


    
