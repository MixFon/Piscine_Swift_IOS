//
//  Deck.swift
//  Exercise01
//
//  Created by Михаил Фокин on 24.11.2020.
//

import Foundation
class Deck : NSObject {
    // Статичесие методы не требуют создания класса. Deck.allSpades
    // Каждый элемент перречисления Value передается в $0
    // В результате на рахдой итерации возвращется конструктор Card где первый аргупет масть, второй значение
    static var allSpades : [Card] { Value.allValues.compactMap{ Card(col: .Spade, val: $0) }}
    static var allDiamonds : [Card] { Value.allValues.compactMap{ Card(col: .Diamond, val: $0) }}
    static var allHearts : [Card] { Value.allValues.compactMap{ Card(col: .Heart, val: $0) }}
    static var allClubs : [Card] { Value.allValues.compactMap{ Card(col: .Club, val: $0) }}
    static var allCards : [Card] = allSpades + allClubs + allHearts + allDiamonds
}
