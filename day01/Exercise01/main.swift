//
//  main.swift
//  Exercise00
//
//  Created by Михаил Фокин on 24.11.2020.

import Foundation
func compareIsEqual(one : Card, two : Card) -> Void {
    if (one.isEqual(two)) {
        print("\(one) == \(two)")
    }
    else {
        print("\(one) != \(two)")
    }
}

func compare(one : Card, two : Card) -> Void {
    if (one == two) {
        print("\(one) == \(two)")
    }
    else {
        print("\(one) != \(two)")
    }
}
print("Constructor:")
var one = Card(col: Color.Club, val : Value.Ace)
print(one)
one = Card(col: Color.Diamond, val : Value.Jack)
print(one)
one = Card(col: Color.Heart, val : Value.Queen)
print(one)

print("Compare: isEqual")
print("False:")
compareIsEqual(one : one, two : Card(col: Color.Club, val: Value.Jack))
compareIsEqual(one : one, two : Card(col: Color.Heart, val: Value.Ace))
compareIsEqual(one : one, two : Card(col: Color.Spade, val: Value.four))
compareIsEqual(one : one, two : Card(col: Color.Diamond, val: Value.four))
print("True:")
compareIsEqual(one : one, two : Card(col: Color.Heart, val: Value.Queen))

print("Compare: ==")
print("False:")
compare(one : one, two : Card(col: Color.Club, val: Value.Jack))
compare(one : one, two : Card(col: Color.Heart, val: Value.Ace))
compare(one : one, two : Card(col: Color.Spade, val: Value.four))
compare(one : one, two : Card(col: Color.Diamond, val: Value.four))
print("True:")
compare(one : one, two : Card(col: Color.Heart, val: Value.Queen))
