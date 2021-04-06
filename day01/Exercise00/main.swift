//
//  main.swift
//  Exercise00
//
//  Created by Михаил Фокин on 24.11.2020.
//

import Foundation
print("Enum Color:")
print(Color.allColors)
for col in Color.allColors {
    print("\(col) = \(col.rawValue)")
}
print("")
print("Enum Value:")
print(Value.allValues)
for val in Value.allValues {
    print("\(val) = \(val.rawValue)")
}
