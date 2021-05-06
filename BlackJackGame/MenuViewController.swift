//
//  ViewController.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-06.
//

import UIKit

class MenuViewController: UIViewController {

    var numberOfDecks = 1{
        didSet{
            
        }
    }
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.text = "How Many Decks Would You Like To Play With?"
        label.textAlignment = .center
        return label
    }()
    
    var deckSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue  = 8
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Play", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
        return btn
    }()
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "BlackJack"
        
        setupDeck()
    }

    /// shuffles deck of cards player can choose how many decks 1-8
    func setupDeck(){
        
        textLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        deckSlider.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 50)
        playButton.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        
        
        view.addSubview(textLabel)
        view.addSubview(deckSlider)
        view.addSubview(playButton)
        
    }
    
    @objc func sliderValueChanged(){
        numberOfDecks = Int(deckSlider.value)
        DispatchQueue.main.async {
            self.textLabel.text = "How Many Decks Would You Like To Play With? : \(self.numberOfDecks)"
        }
    }
    
    @objc func startGame(){
        let playVC = PlayGameViewController()
        navigationController?.pushViewController(playVC, animated: true)
    }
    

}


