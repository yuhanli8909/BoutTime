//
//  Historical Event.swift
//  BoutTime
//
//  Created by Yuhan Li on 31/07/2017.
//  Copyright © 2017 Yuhanli. All rights reserved.
//

import Foundation

var HistoricalEvent: [String: String] = [
    "Fire" : "1 million years ago",
    "Boat" : "8000 B.C.",
    "Concrete" : "6500 B.C.",
    "Wheel" : "3500 B.C."
]

class Event{
    
    var eventDescription: String
    var time: String
    
    init(eventDescription: String, time: String) {
        self.eventDescription = eventDescription
        self.time = time
    }
}

