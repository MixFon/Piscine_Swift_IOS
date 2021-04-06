//  Deck.swift
//  Exercise01
//  Created by Михаил Фокин on 24.11.2020.
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
    
    
    override var description: String { return "\(self.cards)" }
    var cards : [Card]      // Новая колода карт
    var discards : [Card]   // Колода сброса
    var outs : [Card]       // Карты которые нет но в колоде ни в сбросах
    
    // Перед вызовод инициализатора суперкласса (super.init()) все поля подкласса должны быть проинициализированы.
    init(bl_sort : Bool) {
        if bl_sort {
            self.cards = Deck.allCards
        }
        else {
            self.cards = Deck.allCards.mixing()
        }
        self.discards = []
        self.outs = []
        super.init()
    }
    // Функция извлекает первую карту и перемещает ее в outs. Если карт нет возвращает nil
    func drow() -> Card? {
        if cards.isEmpty {
            return nil
        }
        let card = cards.removeFirst()
        print("Card \(card) moved to out.")
        outs.append(card)
        return (card)
    }
    // Если карта, передаваемая вторым параметром находится в outs, то она передается в сброс (discards)
    // Для использования contains необходимо переопределить метод isEqual в классе Card.
    func fold(c: Card) {
        if self.outs.contains(c) {
            self.discards.append(c)
            self.outs.remove(at: self.outs.firstIndex(of: c)!)
        }
    }
}

// Расширение для перемешивания колоды
extension Array {
    // Создается функция расширяющая все массивы данного проекта. Перемешывает все элементы.
    // Elemnt указывает на то что возвращающий массив может содержать элементы произввольно типа.
    // Приставка mutating необходима для внемения изменений.
    mutating func mixing() -> [Element] {
        // Создается переменная на массив, вызывающий метод mixing.
        var thisArr = self
        for i in 0..<thisArr.count {
            let randVal = Int(arc4random_uniform(UInt32(thisArr.count)))
            let temp  = thisArr[i]
            thisArr[i] = thisArr[randVal]
            thisArr[randVal] = temp
        }
        return thisArr
    }
    
}
