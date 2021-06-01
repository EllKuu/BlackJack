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
    
    var testArray = [9,1,1,9,5,2]
    
    var numberOfDecksStackView: NumberOfDecksView!
    var playBlackJackView: PlayBlackJackView!
    
    var playersHandSorted = [PlayingCard]()
    var dealersHandSorted = [PlayingCard]()
    
    var dealersHandUnsorted = [PlayingCard]()
    
    var playersHandAceCount = 0
    var dealersHandAceCount = 0
    
    var playersTurn: Bool?
    var dealersTurn: Bool?
    
    var playersHandSortedTotal = 0
    var dealersHandSortedTotal = 0
    
    var playerWins = 0 {
        didSet{
            self.playBlackJackView.scoreLabel.text = "Wins : \(playerWins) - Losses : \(playerLoses)"
        }
    }
    var playerLoses = 0 {
        didSet{
            self.playBlackJackView.scoreLabel.text = "Wins : \(playerWins) - Losses : \(playerLoses)"
        }
    }
    
    
    enum HandOutcomes {
        case playerOver21
        case dealerOver21
        case playerBlackjack
        case dealerBlackjack
        case tie
        case dealerStands17PlayersTotalIsGreater
        case dealerStands17DealersTotalIsGreater
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
        
        view.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barTintColor = .red
        
    }
    
    func setupDeck(){
        let numberOfCards = self.numberOfDecks * 52
        numberArray = Array(1...numberOfCards)

        for i in numberArray{
            let p = PlayingCard(number: i)
            deck.append(p)
        }
        
//        for i in testArray{
//            let p = PlayingCard(number: i)
//            deck.append(p)
//        }
        
        deck.shuffle()
        print("cards in deck \(deck.count)")
        
//        for i in deck{
//            print("\(i.cardNumber) - \(i.cardValue)")
//        }
        
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
            self.playBlackJackView.hitBtn.isEnabled = false
            self.playBlackJackView.stayBtn.isEnabled = false
            self.playBlackJackView.newHandBtn.isEnabled = false
        }
    
    }
    
    
}// end of extension

extension PlayGameViewController: PlayBlackJackProtocol{
   
    
    func dealHand() {
        
        if deck.count <= Int(deck.count/3){
            reShuffleDeck()
        }
       
        for i in 1...4{
            let card = removeCard()
            if i % 2 != 0 {
                addCardToPlayersHand(card: card.cardFaceImage!)
                if card.cardValue! == 11{
                    playersHandSorted.insert(card, at: playersHandSorted.endIndex)
                }else{
                    playersHandSorted.insert(card, at: playersHandSorted.startIndex)
                }
               
            }else{
                if card.cardValue! == 11{
                    dealersHandSorted.insert(card, at: dealersHandSorted.endIndex)
                }else{
                    dealersHandSorted.insert(card, at: dealersHandSorted.startIndex)
                }
                
                dealersHandUnsorted.append(card)
                
                if i == 2{
                    addCardToDealersHand(card: card.cardBackImage!)
                }
                else{
                    addCardToDealersHand(card: card.cardFaceImage!)
                }
                
            }
        }
        
        playersTurn = true
        dealersTurn = false
        
        self.playBlackJackView.hitBtn.isEnabled = true
        self.playBlackJackView.stayBtn.isEnabled = true
        self.playBlackJackView.newHandBtn.isEnabled = false
        
        calculatePlayersHand()
        //calculateDealersHand()
        
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
                    playersHandSorted.insert(card, at: playersHandSorted.endIndex)
                    playersHandAceCount += 1
                }else{
                    playersHandSorted.insert(card, at: playersHandSorted.startIndex)
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
                    dealersHandSorted.insert(card, at: dealersHandSorted.endIndex)
                    dealersHandAceCount += 1
                }else{
                    dealersHandSorted.insert(card, at: dealersHandSorted.startIndex)
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
        calculatePlayersHand()
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
    
        for card in playersHandSorted{
            print("\(card.cardValue) - \(card.altCardValue) ")
            total += card.cardValue!
            
            if card.cardValue! == 11{
                if playersHandSorted.count > 2 && total >= 21{
                    let newTotal = total - card.cardValue! + card.altCardValue!
                    total = newTotal
                }
                else if total > 21 {
                    let newTotal = total - card.cardValue! + card.altCardValue!
                    total = newTotal
                    print("play ace")
                }
            }
        }
        
        print("Player  total: \(total)")
        
        playersHandSortedTotal = total
        playersHandSortedResults(total: playersHandSortedTotal)
        
    }
    
    func calculateDealersHand(){
        
        var total = 0
        
            for card in dealersHandSorted{
                print("\(card.cardValue) - \(card.altCardValue)")
                total += card.cardValue!
                
                if card.cardValue! == 11{
                    
                    // 2 aces in hand at start
                    if dealersHandSorted.count > 2 && total >= 21{
                        let newTotal = total - card.cardValue! + card.altCardValue!
                        total = newTotal
                    }
                    // ace added total as 11 pushes the hand over 21
                    else if total > 21 {
                        let newTotal = total - card.cardValue! + card.altCardValue!
                        total = newTotal
                        print("case 1")
                    }
                    // ace added to the hand as 11 is still less than the oppsite hands total
                    else if total <= playersHandSortedTotal {
                        let newTotal = total - card.cardValue! + card.altCardValue!
                        total = newTotal
                        print("case 2")
                    }
                }
                
            }
        
        
        print("Dealer total: \(total)")
        
        dealersHandSortedTotal = total
        dealersHandSortedResults(total: dealersHandSortedTotal)
        
    }

    
    func playersHandSortedResults(total: Int){
     
        if total > 21 {
            
            gameInformation(outcome: HandOutcomes.playerOver21)
            
            flipDealersFaceDownCard()
            dealersTurn = true
            playersTurn = false
            self.playBlackJackView.hitBtn.isEnabled = false
            self.playBlackJackView.stayBtn.isEnabled = false
            self.playBlackJackView.newHandBtn.isEnabled = true
        }
        else if total == 21{
            flipDealersFaceDownCard()
            dealersTurn = true
            playersTurn = false
            self.playBlackJackView.hitBtn.isEnabled = false
            self.playBlackJackView.stayBtn.isEnabled = false
            calculateDealersHand()
        }
        
        
    }
    
    func dealersHandSortedResults(total: Int){
        
        if dealersTurn!{
            if total < 17 && total < playersHandSortedTotal {
                    dealerHit()
            }
            else if total > 21 {
                gameInformation(outcome: HandOutcomes.dealerOver21)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
            else if total >= 17 && total < 21 && total < playersHandSortedTotal {
                gameInformation(outcome: HandOutcomes.dealerStands17PlayersTotalIsGreater)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
            else if total != 21 && playersHandSortedTotal == 21{
                gameInformation(outcome: HandOutcomes.playerBlackjack)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
            else if total == 21 && playersHandSortedTotal == 21 {
                gameInformation(outcome: HandOutcomes.tie)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
            else if total >= 17 && total == playersHandSortedTotal{
                gameInformation(outcome: HandOutcomes.tie)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
            else if total == 21 && playersHandSortedTotal != 21{
                gameInformation(outcome: HandOutcomes.dealerBlackjack)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
          else if total < 21 && total > playersHandSortedTotal {
                gameInformation(outcome: HandOutcomes.dealerStands17DealersTotalIsGreater)
                self.playBlackJackView.newHandBtn.isEnabled = true
                self.playBlackJackView.hitBtn.isEnabled = false
                self.playBlackJackView.stayBtn.isEnabled = false
            }
        }
        else{
            print("dealers turn false")
        }
        
       
    }
    
    
    
    func gameInformation(outcome: HandOutcomes){
        switch outcome {
        
        case .playerOver21:
            self.playBlackJackView.informationLabel.text = "Players hand is over 21, Dealer wins!."
            playerLoses += 1
            
        case .dealerOver21:
            self.playBlackJackView.informationLabel.text = "Dealers hand is over 21, Player wins!."
            
            playerWins += 1
            
        case .playerBlackjack:
            self.playBlackJackView.informationLabel.text = "Player shows 21. Player wins."
            
        case .tie:
            self.playBlackJackView.informationLabel.text = "Hand is a draw."
            
        case .dealerStands17PlayersTotalIsGreater:
            self.playBlackJackView.informationLabel.text = "Dealer stands on any total 17 and above, players hand is greater."
            
            playerWins += 1
            
        case .dealerStands17DealersTotalIsGreater:
            self.playBlackJackView.informationLabel.text = "Dealer stands on any total 17 and above, dealers hand is greater."
            
            playerLoses += 1
            
        case .dealerBlackjack:
            self.playBlackJackView.informationLabel.text = "Dealer shows 21. Dealer Wins."
            
            playerLoses += 1

        }
        
        
    }
    
    func reShuffleDeck(){
        print("the num decks  \(numberOfDecks)")
        deck.removeAll()
        setupDeck()
    }
    
    func newHand(){
        // clear stackviews and arrays
        for i in self.playBlackJackView.dealersHandStackView.arrangedSubviews{
            i.removeFromSuperview()
        }
        
        for i in self.playBlackJackView.playersHandStackView.arrangedSubviews{
            i.removeFromSuperview()
        }
        
        dealersHandSorted.removeAll()
        playersHandSorted.removeAll()
        dealersHandUnsorted.removeAll()
        
        self.playBlackJackView.informationLabel.text = "Tap deck to deal new hand."
        //print("cards in deck \(deck.count)")
        
        playersHandAceCount = 0
        dealersHandAceCount = 0
        
    }
    
    
    
    func flipDealersFaceDownCard(){
        
        self.playBlackJackView.dealersHandStackView.arrangedSubviews[0].removeFromSuperview()
        
        self.playBlackJackView.dealersHandStackView.insertArrangedSubview(dealersHandUnsorted[0].cardFaceImage!, at: 0)
    }
    
    
    func probabilityGuide() {
        print("Prob Guide")
    }
    
    
}
