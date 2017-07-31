//
//  Historical Event.swift
//  BoutTime
//
//  Created by Yuhan Li on 31/07/2017.
//  Copyright © 2017 Yuhanli. All rights reserved.
//

import Foundation


class Event{
    
    var eventDescription: String
    var time: String
    
    init(eventDescription: String, time: String) {
        self.eventDescription = eventDescription
        self.time = time
    }
}



var HistoricalEvent = [
    
    ["Description": "Fire",
     "time": "1 million years ago"],
    ["Description":"Boat",
     "time" : "8000 B.C."],
    ["Description":"Concrete",
     "time":"6500 B.C."],
    ["Description":"Wheel",
     "time":"3500 B.C."]
    
]
