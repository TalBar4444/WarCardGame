//
//  GameManager.swift
//  WarCardGame
//
//  Created by Student31 on 12/08/2024.
//

import Foundation

class GameManager{
    
    var cards: [Card]
    var leftPlayer: Player
    var rightPlayer: Player
    //var deck: [Card]
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
            Card(value: 14, image: "card14"),
            Card(value: 15, image: "joker")
            
            ]
        
        // split the cards between the players
        //let half = self.cards.count / 2
        self.cards.shuffle()
        let leftPlayerCards = Array(self.cards[0..<self.cards.count])
        let rightPlayerCards = Array(self.cards[0..<self.cards.count])
            
        self.leftPlayer = Player(name: "Left Player",score: 0, cards: leftPlayerCards) // left
        self.rightPlayer = Player(name: "Right Player",score: 0, cards: rightPlayerCards) // right
        
       // self.warCards = [Card]()
    }
    
//    func makeTurn() -> Direction{
//        var direction = Direction.default_direction
    func makeTurn() {
        
        let left_open_card = self.leftPlayer.getCard()
        let right_open_card = self.rightPlayer.getCard()
        
        if left_open_card.value > right_open_card.value {
            leftPlayer.score += 1
            self.round += 1
//            self.leftPlayer.addCards(cards: [left_open_card, right_open_card])
            //direction = Direction.player_left_direction
        }
        
//        if left_open_card.compare(card: right_open_card) == 1
//        {
            
//        else if left_open_card.compare(card: right_open_card) == -1
//        {
        else if right_open_card.value > left_open_card.value {
            rightPlayer.score += 1
            self.round += 1
//            self.rightPlayer.addCards(cards: [left_open_card, right_open_card])
            //direction = Direction.player_right_direction
        }
//        else
//        {
//            // reset the war cards
//            direction = war(pc1: left_open_card, pc2: right_open_card)
//        }
//
//        return direction
    }
//
//    func war(pc1:Card, pc2:Card){ //-> Direction{
////        self.warCards = [pc1, pc2]
////
////        var direction = Direction.default_direction
//
//        // get 3 cards from each player if they have enough cards
//        let leftPlayerCards = self.leftPlayer.cards.count >= 3 ? 3 : self.leftPlayer.cards.count
//        let rightPlayerCards = self.rightPlayer.cards.count >= 3 ? 3 : self.rightPlayer.cards.count
//
//        for _ in 0..<rightPlayerCards{
//            warCards.append(self.rightPlayer.getCard())
//        }
//
//        for _ in 0..<leftPlayerCards{
//            warCards.append(self.leftPlayer.getCard())
//        }
//
//        // compare the last card
//        let pc1 = self.leftPlayer.getCard()
//        let pc2 = self.rightPlayer.getCard()
//
//        self.warCards.append(pc1)
//        self.warCards.append(pc2)
//
//        if pc1.compare(card: pc2) == 1{
//            self.leftPlayer.addCards(cards: self.warCards)
//            direction = Direction.player_left_direction
//
//        }else if pc1.compare(card: pc2) == -1{
//            self.rightPlayer.addCards(cards: self.warCards)
//            direction = Direction.player_right_direction
//
//        }else{
//            direction = war(pc1: pc1, pc2: pc2)
//        }
//
//        return direction
//    }
    
//    func isGameOver() -> Bool{
//        return self.leftPlayer.cards.count == 0 || self.rightPlayer.cards.count == 0 || self.round == 10 //MAX_TURNS
//    }
    
    func isGameOver() -> Bool{
        return self.leftPlayer.cards.count == 0 || self.rightPlayer.cards.count == 0 || self.round == 10 //MAX_TURNS
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
