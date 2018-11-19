//
//  ViewController.swift
//  MatchingGame
//
//  Created by Halil Özel on 19.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount : Int = 0{
        
        // değer kaydedilmeden önceki kullanım
        didSet{
            flipCountLabel.text = "Flip : \(flipCount)"

        }
    }
  
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices : Array<String> = ["🎃","👻","🎃","👻"]
    @IBAction func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            
        }else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        
        print("flipCard(withEmoji : \(emoji)")
        
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
    

}

