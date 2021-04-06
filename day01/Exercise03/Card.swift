//  Card.swift
//  Exercise01
//  Created by Михаил Фокин on 24.11.2020.

import Foundation
class Card : NSObject {
    let color : Color
    let value : Value
    override var description: String { return "(\(self.color.rawValue), \(self.value.rawValue))" }
    init(col : Color, val : Value) {
        self.color = col
        self.value = val
        super.init()
    }
    override func isEqual(_ object: Any?) -> Bool {
        if !(object is Card) {
            return false
        }
        let res = object as! Card
        return res.color == self.color && res.value == self.value
    }
    static func == (one : Card, two : Card) -> Bool {
        return one.color == two.color && one.value == two.value
    }
}
