//
//  Player.swift
//  WarCardGame
//
//  Created by Tal Bar on 12/08/2024.
//

import Foundation

class Player{
    var name: String
    var score: Int
    var cards: [Card]
    
    
    init(name: String, score: Int, cards: [Card]){
        self.name = name
        self.score = score
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
        return self.score
    }
    
    func getCardScore() -> Int{
        return self.cards[0].value
    }
    
    func getName() -> String{
        return self.name
    }
    
    func setName(name: String){
        self.name = name
    }
    
    
    
}
