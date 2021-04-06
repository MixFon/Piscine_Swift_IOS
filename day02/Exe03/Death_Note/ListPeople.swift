//
//  MensDeathNote.swift
//  Death_Note
//
//  Created by Михаил Фокин on 25.11.2020.
//

import Foundation

class LinstPeople {
    var titel : String
    var listHuman : [Human]
    init() {
        titel = "Death Note"
        listHuman = LinstPeople.allHuman
    }
}

struct Human {
    var name : String
    var description : String
}

extension LinstPeople {
    static var allHuman : [Human] {
        return [
            Human(name: "Добробаба Галина", description: "Тут какое-то описание Добробабы"),
            Human(name: "Гиря Василий", description: "Очень позитивный и общительный человек"),
            Human(name: "Сосиска Наталья", description: "Работает повором")
        ]
    }
}

/*
Human(name: "Добробаба Галина", description: "Тут какое-то описание Добробабы", dateDeath: Date(timeIntervalSinceNow: 20)),
Human(name: "Гиря Василий", description: "Очень позитивный и общительный человек",dateDeath: Date(timeIntervalSinceNow: 50)),
Human(name: "Сосиска Наталья", description: "Работает повором", dateDeath: Date(timeIntervalSinceNow: 100))
 */
/*
 MenDeathNote(titleName: "Добробаба Галина", descriptionName: "Тут какое-то описание Добробабы"),
 MenDeathNote(titleName: "Гиря Василий", descriptionName: "Очень позитивный и общительный человек"),
 MenDeathNote(titleName: "Сосиска Наталья", descriptionName: "Работает повором")
                                 ])]
 */
