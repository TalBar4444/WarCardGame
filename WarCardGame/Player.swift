//
//  Player.swift
//  WarCardGame
//
//  Created by Student31 on 12/08/2024.
//

import Foundation

class Player{
    var name: String
    var cards: [Card]
    
    init(name: String, cards: [Card]){
        self.name = name
        self.cards = cards
        self.cards.shuffle()
    }
    
    func getCard() -> Card{
        let card = self.cards.removeFirst()
        return card
    }
    
    func addCards(cards: [Card]){
        self.cards.append(contentsOf: cards)
    }
    
    func getCardName() -> String{
        return self.cards[0].getImage()
    }
    
    func getScore() -> Int{
        return self.cards.count
    }
    
    func getCardScore() -> Int{
        return self.cards[0].value
    }
    
    func setName(name: String){
        self.name = name
    }
    
}
