//
//  ViewController.swift
//  MatchingGame
//
//  Created by Halil Özel on 19.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // lazy sadece çağrıldığında oluşur. hafızadan fazla yer yermekten kurtarır.
    lazy var game = MatchingGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    // sayac tanımlandı.
    var flipCount : Int = 0{
        
        // değer kaydedilmeden önceki kullanım
        didSet{
            flipCountLabel.text = "Flip : \(flipCount)"

        }
    }
  
    
    // label tanımlama
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    // buttonlar ile array tanımlama
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel(){
        
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
            
        }
    }
    
    
    // emojileri ekleme
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    var emoji = [Int:String]()

    
    func emoji(for card: Card)-> String{
        if emoji[card.indentifier] == nil,emojiChoices.count > 0 {
            
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.indentifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.indentifier] ?? "?"
    }
}
    


