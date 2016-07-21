//
//  Time.swift
//  AppleNewsCreator
//
//  Created by A J LEVINGS on 21/03/2016.
//  Copyright © 2016 Gylphi. All rights reserved.
//

import Foundation

public extension NSDate {

    public func utc() -> String {
        let dateFormatter = NSDateFormatter()
        //The Z at the end of your string represents Zulu which is UTC;
        let timeZone = NSTimeZone(name: "UTC")
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let time = dateFormatter.stringFromDate(self)
        return time
    }

    
}
