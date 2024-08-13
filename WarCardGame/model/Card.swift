//
//  CardModel.swift
//  WarCardGame
//
//  Created by Student31 on 12/08/2024.
//

import Foundation


class Card{
    let value: Int
    let image: String
    
    init(value: Int, image: String){
        self.value = value
        self.image = image
    }
    
    
    // compare between two cards
    func compare(card: Card) -> Int{
        if self.value > card.value{
            return 1
        }else if self.value < card.value{
            return -1
        }else{
            return 0
        }
    }
    
    func getImage() -> String{
        return self.image
    }
    
    
}
