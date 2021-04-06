//
//  ListLocation.swift
//  Kanto
//
//  Created by Михаил Фокин on 30.11.2020.
//

import Foundation

struct Location {
    var nameLocation : String
}

extension Location {
    static var allNameLocation : [Location] {
        return [
            Location(nameLocation: "42"),
            Location(nameLocation: "Saint Ouen"),
            Location(nameLocation: "Grenoble"),
            Location(nameLocation: "Reims"),
            Location(nameLocation: "Moldavie"),
            Location(nameLocation: "Circuit")
        ]
    }
}
