//
//  Matching Game.swift
//  MatchingGame
//
//  Created by Halil Özel on 20.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

class MatchingGame {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                // check if cards match

                if cards[matchIndex].indentifier == cards[index].indentifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
               
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            }else{
                
                // either no cards or 2 cards are face up
                
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards{
            
            let card = Card()
            cards += [card, card]
        }
    
        // TODO: Shuffle the cards
    }
}
