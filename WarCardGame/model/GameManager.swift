//
//  GameManager.swift
//  WarCardGame
//
//  Created by Tal Bar on 12/08/2024.
//

import Foundation

class GameManager{
    
    var cards: [Card]
    var leftPlayer: Player
    var rightPlayer: Player
    var round: Int = 0
    
    
    init() {
        self.cards = [
            Card(value: 2, image: "card2"),
            Card(value: 3, image: "card3"),
            Card(value: 4, image: "card4"),
            Card(value: 5, image: "card5"),
            Card(value: 6, image: "card6"),
            Card(value: 7, image: "card7"),
            Card(value: 8, image: "card8"),
            Card(value: 9, image: "card9"),
            Card(value: 10, image: "card10"),
            Card(value: 11, image: "card11"),
            Card(value: 12, image: "card12"),
            Card(value: 13, image: "card13"),
            Card(value: 14, image: "card14")]
        
        // split the cards between the players
    
        self.cards.shuffle()
        let leftPlayerCards = Array(self.cards[0..<self.cards.count])
        let rightPlayerCards = Array(self.cards[0..<self.cards.count])
            
        self.leftPlayer = Player(name: "Left Player",score: 0, cards: leftPlayerCards) // left
        self.rightPlayer = Player(name: "Right Player",score: 0, cards: rightPlayerCards) // right
        
    }
    
    func calcScore() {
        
        let left_open_card = self.leftPlayer.getCard()
        let right_open_card = self.rightPlayer.getCard()
        
        if left_open_card.value > right_open_card.value {
            leftPlayer.score += 1
        
        }
        
        else if right_open_card.value > left_open_card.value {
            rightPlayer.score += 1
        }
        
        self.round += 1
    }
    
    func isGameOver() -> Bool{
        return self.leftPlayer.cards.count == 0 || self.rightPlayer.cards.count == 0 || self.round == MAX_TURNS
    }
    
    
    func getWinner() -> Player{
        if self.leftPlayer.score > self.rightPlayer.score {
            return self.leftPlayer
        }else if self.leftPlayer.score < self.rightPlayer.score {
            return self.rightPlayer
        }else{
            return self.leftPlayer
        }
    }

}
