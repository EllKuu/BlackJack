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
    
    var playersHand = [PlayingCard]()
    var dealersHand = [PlayingCard]()
    
    var playersTurn: Bool?
    var dealersTurn: Bool?
    
    var playersHandTotal = 0
    var dealersHandTotal = 0
    
    
    enum HandOutcomes {
        case playerOver21
        case dealerOver21
        case blackjack
        case tie
        case dealerStands17PlayersTotalIsGreater
        case dealerStands17DealersTotalIsGreater
        case dealerWins
        case playerWins
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectNumberOfDecks = NumberOfDecksView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        selectNumberOfDecks.numberOfDecksDelegate = self
        numberOfDecksStackView = selectNumberOfDecks
        view.addSubview(selectNumberOfDecks)
        
        let playBlackJack = PlayBlackJackView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        playBlackJack.playBlackJackDelegate = self
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
            self.playBlackJackView.informationLabel.text = "Tap Deck to Deal"
        }
    
    }
    
    
}// end of extension

extension PlayGameViewController: PlayBlackJackProtocol{
   
    
    func dealHand() {
        // init cards and give to stackview in playblackjackview
       
        
        for i in 1...4{
            let card = removeCard()
            //print(card.cardValue!)
            if i % 2 != 0 {
                addCardToPlayersHand(card: card.cardFaceImage!)
                playersHand.append(card)
            }else{
                if i == 2{
                    addCardToDealersHand(card: card.cardBackImage!)
                }else{
                    addCardToDealersHand(card: card.cardFaceImage!)
                }
                dealersHand.append(card)
            }
            
            playersTurn = true
            dealersTurn = false
            
            calculatePlayersHand()
            calculateDealersHand()
            
        }
    } // end of dealCards
    
    func removeCard() -> PlayingCard{
        let card = deck.remove(at: 0)
        return card
    }
    
    func playerHit() {
        if let playersTurn = playersTurn {
            if playersTurn{
                let card = removeCard()
                addCardToPlayersHand(card: card.cardFaceImage!)
                if card.cardValue! == 11{
                    playersHand.insert(card, at: playersHand.endIndex)
                }else{
                    playersHand.insert(card, at: playersHand.startIndex)
                }
                calculatePlayersHand()
            }else{
                print("not players turn")
            }
        }
    }
    
    func dealerHit(){
        if let dealersTurn = dealersTurn{
            if dealersTurn{
                let card = removeCard()
                addCardToDealersHand(card: card.cardFaceImage!)
                if card.cardValue! == 11{
                    dealersHand.insert(card, at: dealersHand.endIndex)
                }else{
                    dealersHand.insert(card, at: dealersHand.startIndex)
                }
                
                calculateDealersHand()
            }
        }
    }
    
    func playerStay() {
        print("player stay")
        playersTurn = false
        dealersTurn = true
        flipDealersFaceDownCard()
        calculateDealersHand()
    }
    
    
    func addCardToDealersHand(card: UIImageView){
        self.playBlackJackView.dealersHandStackView.addArrangedSubview(card)
    }
    
    func addCardToPlayersHand(card: UIImageView){
        self.playBlackJackView.playersHandStackView.addArrangedSubview(card)
    }
    
    func calculatePlayersHand(){
        var total = 0
        
        for card in playersHand{
            // add card to total
            if card.cardValue! == 11{
                total += card.cardValue!
                if total > 21 {
                    total = total - card.cardValue!
                    total = total + card.altCardValue!
                    print("play ace")
                }
            }else{
                total += card.cardValue!
            }
           
           
        }
        
        print("Player  total: \(total)")
        playersHandTotal = total

        //print("Player  total: \(playersHandTotal)")
        playersHandResults(total: playersHandTotal)
        
    }
    
    func calculateDealersHand(){
        var total = 0
    
        for card in dealersHand{
            // add card to total
            if card.cardValue! == 11{
                total += card.cardValue!
                if total > 21 {
                    total = total - card.cardValue!
                    total = total + card.altCardValue!
                    print("deal ace")
                }
            }else{
                total += card.cardValue!
            }
            
        }
        
        print("Dealer total: \(total)")
        dealersHandTotal = total
    
        //print("Dealer total: \(dealersHandTotal)")
        dealersHandResults(total: dealersHandTotal)
        
    }
    
    func playersHandResults(total: Int){
     
        if total > 21 {
            
                gameInformation(outcome: HandOutcomes.playerOver21)
            
            flipDealersFaceDownCard()
            // new hand
        }
        else if total == 21{
            flipDealersFaceDownCard()
            dealersTurn = true
            playersTurn = false
            calculateDealersHand()
        }
    }
    
    func dealersHandResults(total: Int){
       
        if total == 21 && playersHandTotal == 21 {
            gameInformation(outcome: HandOutcomes.tie)
        }
        else if total == 21 && playersHandTotal != 21{
            gameInformation(outcome: HandOutcomes.dealerWins)
        }
        else if total >= 17 && total < 21 && total < playersHandTotal {
            gameInformation(outcome: HandOutcomes.dealerStands17PlayersTotalIsGreater)
            
        }else if total >= 17 &&  total < 21 && total > playersHandTotal{
            gameInformation(outcome: HandOutcomes.dealerStands17DealersTotalIsGreater)
        }
        else if total < 17 && total <= playersHandTotal {
                dealerHit()
        }
        else if total > 21 {
            gameInformation(outcome: HandOutcomes.dealerOver21)
        }

    }
    
    
    
    func gameInformation(outcome: HandOutcomes){
        switch outcome {
        case .playerOver21:
            self.playBlackJackView.informationLabel.text = "Over 21, You Lose."
            
        case .dealerOver21:
            self.playBlackJackView.informationLabel.text = "Dealer over 21, players hand wins."
            
        case .blackjack:
            self.playBlackJackView.informationLabel.text = "BlackJack."
            
        case .tie:
            self.playBlackJackView.informationLabel.text = "Tie."
            
        case .dealerStands17PlayersTotalIsGreater:
            self.playBlackJackView.informationLabel.text = "Dealer stands 17, players hand wins."
            
        case .dealerWins:
            self.playBlackJackView.informationLabel.text = "Dealer Wins."
            
        default:
            print("default")
        }
        
        
        
    }
    
    func newHand(){
        // clear stackviews and arrays
        for i in self.playBlackJackView.dealersHandStackView.arrangedSubviews{
            i.removeFromSuperview()
        }
        
        for i in self.playBlackJackView.playersHandStackView.arrangedSubviews{
            i.removeFromSuperview()
        }
        
        dealersHand.removeAll()
        playersHand.removeAll()
        
        self.playBlackJackView.informationLabel.text = ""
        
    }
    
    
    
    func flipDealersFaceDownCard(){
        
        self.playBlackJackView.dealersHandStackView.arrangedSubviews[0].removeFromSuperview()
        
        self.playBlackJackView.dealersHandStackView.insertArrangedSubview(dealersHand[0].cardFaceImage!, at: 0)
    }
    
    
    func probabilityGuide() {
        print("Prob Guide")
    }
    
    
}
