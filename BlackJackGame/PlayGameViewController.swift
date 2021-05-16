//
//  PlayGameViewController.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-06.
//

import UIKit


class PlayGameViewController: UIViewController {
    
    
    var numberOfDecks: Int = 1
    var numberArray = [Int]()
    var deck = [PlayingCard]()
    
    var numberOfDecksStackView: NumberOfDecksView!
    var playBlackJackView: PlayBlackJackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectNumberOfDecks = NumberOfDecksView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        selectNumberOfDecks.numberOfDecksDelegate = self
        numberOfDecksStackView = selectNumberOfDecks
        view.addSubview(selectNumberOfDecks)
        
        let playBlackJack = PlayBlackJackView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        playBlackJack.alpha = 0
        playBlackJackView = playBlackJack
        view.addSubview(playBlackJack)
        
        view.backgroundColor = .red
        navigationController?.navigationBar.barTintColor = .red
        
    }
    
    func setupDeck(){
        let numberOfCards = self.numberOfDecks * 52
        numberArray = Array(1...numberOfCards)
        // take number array and setup cards
        for i in numberArray{
            let p = PlayingCard(number: i)
            deck.append(p)
        }
        deck.shuffle()
        
    }
    
} // end of PlayGameViewController

extension PlayGameViewController: NumberOfDecksProtocol{
    func sliderValueChanged() {
        var numImage = ""
        numberOfDecks = Int(numberOfDecksStackView.deckSlider.value)
        switch Int(numberOfDecksStackView.deckSlider.value) {
        case 1:
            numImage = "1.square"
        case 2:
            numImage = "2.square"
        case 3:
            numImage = "3.square"
        case 4:
            numImage = "4.square"
        case 5:
            numImage = "5.square"
        case 6:
            numImage = "6.square"
        case 7:
            numImage = "7.square"
        case 8:
            numImage = "8.square"
        default:
            numImage = "1.square"
        }
        DispatchQueue.main.async {
            self.numberOfDecksStackView.numOfDecksImage.image = UIImage(systemName: numImage)
        }
    }
    
    func gameStart() {
        print("play animation")
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            self.numberOfDecksStackView.transform = CGAffineTransform(translationX: 0, y: -200)
            self.numberOfDecksStackView.alpha = 0
            
        }
        completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn) {
                
                self.playBlackJackView.alpha = 1
                
            }
            
            self.setupDeck()
            self.dealCards()
        }
    
    }
    
    
}// end of extension

extension PlayGameViewController: PlayBlackJackProtocol{
    
    func dealCards() {
        // init cards and give to stackview in playblackjackview

        
        playBlackJackView.dealersHandStackView.addArrangedSubview(deck[1].cardFaceImage!)
        playBlackJackView.dealersHandStackView.addArrangedSubview(deck[2].cardBackImage!)
        
        playBlackJackView.playersHandStackView.addArrangedSubview(deck[3].cardFaceImage!)
        playBlackJackView.playersHandStackView.addArrangedSubview(deck[4].cardFaceImage!)
     
        
        
    }
    
    
}
