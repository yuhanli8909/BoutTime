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

//Test: a game that that returns ONE random event each time.


class historicalEventGame: game {
    
    var numberOfQuestion = 4
    var numberOfRounds = 1

 //Generate random number without repeat

    
    func selectRandomEvent() -> Event {
        
        //returns a single event each time
        let randomQuestionIndex =  GKRandomSource.sharedRandom().nextInt(upperBound: 4)
        var event = historicalEvent[randomQuestionIndex]
        
        if let eventD = event["Description"], let eventT = event["time"] {
            return Event(eventDescription: eventD, time: eventT)
        } else {
            //insert error messsages here
            return Event(eventDescription:"nothing", time:"nothing")
        }
    }
}

//creating an empty array to store random question index later(empty array with initialization)


func generateRandomNumber() -> [Int] {
    var oneRound = [Int]()
    
    for _ in 0...4 {
        let GeneratedIndex = GKRandomSource.sharedRandom().nextInt(upperBound: 8)
        oneRound.append(GeneratedIndex)
        
    }
    
    return oneRound
    
}

//Take the oneRound (array of 4),which is generated randomly each time. Go to the historicalEvent data and get each nested dictionary through the index provided by this array.


func oneSetofQuestions() -> [[String:String]] {
    
    var oneSetofQuestions = [[String:String]]()
    
    for i in generateRandomNumber() {
        let miniDictionary = historicalEvent[i]
        oneSetofQuestions.append(miniDictionary)
    }
    
    return oneSetofQuestions
}

//Binding the dictionary to the Class instance of Event.

func oneSetofEvent() -> [Event] {
    
    var oneSetofEvent = [Event]()
    
    for i in 0...4{
        var event = oneSetofQuestions()[i]
        let oneEvent = Event(eventDescription: event["description"]!, time: event["time"]!)
        oneSetofEvent.append(oneEvent)
    }
    
    return oneSetofEvent
}





