//  main.swift
//  Exercise00
//  Created by Михаил Фокин on 24.11.2020.
print("All Cards")
print(Deck.allCards)
print("All Cards mixing")
print(Deck.allCards.mixing())
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
print(arr)
for _ in arr {
    print(arr.mixing())
}
