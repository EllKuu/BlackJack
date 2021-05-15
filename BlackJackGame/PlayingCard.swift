//
//  PlayingCard.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-14.
//

import UIKit

class PlayingCard {
    
    
    var cardValue: Int?
    var altCardValue: Int?
    var cardFaceImage: UIImageView?
    var cardBackImage: UIImageView?
    
    init(number: Int) {
        cardValue = number
        setupPlayingCard()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupPlayingCard(){
//        contentMode = .scaleAspectFit
//        backgroundColor = .clear
//        clipsToBounds = true
        //print(cardValue)
        guard let value = cardValue else { return }
        switch value {
        case 1...52:
            //print("1 deck")
            setCardValues(num: value)
        case 53...104:
            //print("2 deck")
            setCardValues(num: 52*2 + 1 - value)
        case 105...156:
            //print("3 deck")
            setCardValues(num: 52*3 + 1 - value)
        case 157...208:
            //print("4 deck")
            setCardValues(num: 52*4 + 1 - value)
        case 209...260:
            //print("5 deck")
            setCardValues(num: 52*5 + 1 - value)
        case 261...312:
            //print("6 deck")
            setCardValues(num: 52*6 + 1 - value)
        case 313...364:
            //print("7 deck")
            setCardValues(num: 52*7 + 1 - value)
        case 365...416:
            //print("8 deck")
            setCardValues(num: 52*8 + 1 - value)
        default:
            print("no deck")
        }
        
    }
    
    func setCardValues(num: Int){
        //print("\(num) : number")
        switch num {
        case 1:
            cardValue = 11
            altCardValue = 1
            cardFaceImage = UIImageView(image: UIImage(named: "Ace-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 2:
            cardValue = 2
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Two-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 3:
            cardValue = 3
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Three-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 4:
            cardValue = 4
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Four-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 5:
            cardValue = 5
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Five-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 6:
            cardValue = 6
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Six-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 7:
            cardValue = 7
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Seven-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 8:
            cardValue = 8
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Eight-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 9:
            cardValue = 9
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Nine-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 10:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Ten-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 11:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Jack-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 12:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Queen-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 13:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "King-H"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 14:
            cardValue = 11
            altCardValue = 1
            cardFaceImage = UIImageView(image: UIImage(named: "Ace-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 15:
            cardValue = 2
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Two-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 16:
            cardValue = 3
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Three-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 17:
            cardValue = 4
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Four-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 18:
            cardValue = 5
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Five-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 19:
            cardValue = 6
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Six-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 20:
            cardValue = 7
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Seven-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 21:
            cardValue = 8
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Eight-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 22:
            cardValue = 9
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Nine-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 23:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Ten-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 24:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Jack-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 25:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Queen-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 26:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "King-D"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 27:
            cardValue = 11
            altCardValue = 1
            cardFaceImage = UIImageView(image: UIImage(named: "Ace-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 28:
            cardValue = 2
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Two-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 29:
            cardValue = 3
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Three-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 30:
            cardValue = 4
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Four-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 31:
            cardValue = 5
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Five-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 32:
            cardValue = 6
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Six-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 33:
            cardValue = 7
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Seven-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 34:
            cardValue = 8
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Eight-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 35:
            cardValue = 9
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Nine-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 36:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Ten-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 37:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Jack-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 38:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Queen-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 39:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "King-S"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 40:
            cardValue = 11
            altCardValue = 1
            cardFaceImage = UIImageView(image: UIImage(named: "Ace-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 41:
            cardValue = 2
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Two-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 42:
            cardValue = 3
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Three-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 43:
            cardValue = 4
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Four-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 44:
            cardValue = 5
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Five-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 45:
            cardValue = 6
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Six-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 46:
            cardValue = 7
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Seven-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 47:
            cardValue = 8
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Eight-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 48:
            cardValue = 9
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Nine-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 49:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Ten-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 50:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Jack-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 51:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "Queen-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
        case 52:
            cardValue = 10
            altCardValue = 0
            cardFaceImage = UIImageView(image: UIImage(named: "King-C"))
            cardBackImage = UIImageView(image: UIImage(named: "CardBack"))
            
        default:
            print("Value not included")
        }
    }
    
    
   
}
