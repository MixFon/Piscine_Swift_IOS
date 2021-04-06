//
//  MensDeathNote.swift
//  Death_Note
//
//  Created by Михаил Фокин on 25.11.2020.
//

import Foundation

struct Event {
    var name : String?
    var description : String?
    var maxNumberOfGuest : Int = 0
    var currentNumberOfRegistGuest : Int = 0
    var location : String?
    var type : TypeEvent
    var duration : String?
    var startTime : Date?
    var endTime : Date?
}

enum TypeEvent : String {
    case corporete
    case special
    case play
    case sport
    static let allEvent = [corporete, special, play, sport]
}

extension Event {
    static var startEvetn : [Event] {
        return [
            Event(name: "FirstEvent", description: """
Description events!!!!!!
Hello!
Hi
Привет!
""", maxNumberOfGuest: 100, location: "Moskow", type: TypeEvent.corporete, duration: "one hour", startTime: Date(timeIntervalSinceNow: 10), endTime: Date(timeIntervalSinceNow: 30)),
            Event(name: "Second Event", description: "Two Discription Events", maxNumberOfGuest: 200, location: "Kazan", type: TypeEvent.special, duration: "two hour", startTime: Date(timeIntervalSinceNow: 40), endTime: Date(timeIntervalSinceNow: 60))]
    }
}
