//
//  CardModel.swift
//  WarCardGame
//
//  Created by Tal Bar on 12/08/2024.
//

import Foundation


class Card{
    let value: Int
    let image: String
    
    init(value: Int, image: String){
        self.value = value
        self.image = image
    }
    
    func getImage() -> String{
        return self.image
    }
    
    
}
