//  main.swift
//  Exercise00
//  Created by Михаил Фокин on 24.11.2020.
func printSrack(deck: Deck) {
    for _ in 0..<deck.cards.count {
        print("*", terminator:"")
    }
    print()
    for _ in 0..<deck.outs.count {
        print("#", terminator:"")
    }
    print()
    for _ in 0..<deck.discards.count {
        print("@", terminator:"")
    }
    print()
}

print("Test init(Bool)")
print("New sort cards (true)")
let one = Deck(bl_sort: true)
print(one)
print()
print("New mixing cards (false)")
let two = Deck(bl_sort: false)
print(two)
print()

for _ in 0...10 {
    let res = one.drow()
    if res != nil {
        printSrack(deck: one)
        one.fold(c: res!)
    }
    else {
        print("res == nil")
    }
}
print(one)
print(one.outs)
print(one.discards)
