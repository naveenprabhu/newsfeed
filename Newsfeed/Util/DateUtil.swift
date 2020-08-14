//
//  DateUtil.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 11/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import Foundation

struct DateUtil {
    
    /**
     Converts UTC time stamp to time stamp the user has selecte on his phone
     
     - Parameter dateTime: The UTC dateTime stamp to be converted
     
     -  Returns: The converted local timestamp based on user settings
     */
    static func convertUTCToLocalTime(_ dateTime: String) -> String{
        let utcDateFormatter = DateFormatter()
        utcDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        utcDateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = utcDateFormatter.date(from: dateTime)
        
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = "MMM dd, yyyy hh:mm a"
        localDateFormatter.timeZone = TimeZone.current
        
        let localDateTime = localDateFormatter.string(from: date!)

        return localDateTime
    }
}
