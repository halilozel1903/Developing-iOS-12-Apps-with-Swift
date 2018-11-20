//
//  Card.swift
//  MatchingGame
//
//  Created by Halil Özel on 20.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var indentifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.indentifier = Card.getUniqueIdentifier()
    }
    
}
