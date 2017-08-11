//
//  Game.swift
//  BoutTime
//
//  Created by Yuhan Li on 31/07/2017.
//  Copyright © 2017 Yuhanli. All rights reserved.
//

import Foundation
import GameKit



//Creating game protocol, which historicalEventGame will conform to...

protocol game {
    var numberOfQuestion: Int { get set }
    var numberOfRounds: Int { get set }
  
    func selectRandomEvent() -> Event
}

//Error type

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

//creating an array with 4 items of non-repeating value


func generateRandomNumber() -> [Int] {
    //this array need work base on number of items in the plist
    var questionIndex = [0,1,2,3,4,5,6,7,8,9,10]
    var oneRound = [Int]()
    
    for _ in 0...4 {
        let GeneratedIndex = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        let selectedQuestion = questionIndex[GeneratedIndex]
        oneRound.append(selectedQuestion)
        questionIndex.remove(at: GeneratedIndex)
    }
    
    return oneRound
    
}

//Error State for collecting data

enum DataError: Error{
    case invalidResource
    case conversionFailure
    case invalidData
}

//Converts plist data to an array with nested dictionary

class PlistConverter {
    
    static func dictionary(fromFile name: String, ofType type: String) throws -> [String: String] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw DataError.invalidResource
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String: String] else {
            throw DataError.conversionFailure
        }
        
        return dictionary
    }

}

//Converts Array into the Event Class

class EventDataUnarchiver {
    static func eventData(fromDictionary dictionary: [String: String]) throws -> [Event] {
    
        var eventData: [Event] = []
        
        for (key, value) in dictionary {
            let content = Event(eventDescription: key, time: value)
            eventData.append(content)
        }

        return eventData
    }
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





