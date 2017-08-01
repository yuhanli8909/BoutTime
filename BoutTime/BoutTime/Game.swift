//
//  Game.swift
//  BoutTime
//
//  Created by Yuhan Li on 31/07/2017.
//  Copyright © 2017 Yuhanli. All rights reserved.
//

import Foundation
import GameKit


protocol game {
    var numberOfQuestion: Int { get set }
    var numberOfRounds: Int { get set }
  
    func selectRandomEvent() -> Event
}


enum historicalEventError: Error{
    case inputmissing
}


class historicalEventGame: game {
    
    var numberOfQuestion = 4
    var numberOfRounds = 6

    
    func selectRandomEvent() -> Event {
        let randomQuestionIndex =  GKRandomSource.sharedRandom().nextInt(upperBound: 4)
        var event = historicalEvent[randomQuestionIndex]
        
        if let eventD = event["Description"], let eventT = event["time"] {
            return Event(eventDescription: eventD, time: eventT)
        } else {
            return Event(eventDescription:"nothing", time:"nothing")
        }
    }
}
