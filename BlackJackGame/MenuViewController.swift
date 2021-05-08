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
        label.text = "How many decks would you like to play with?"
        label.font = UIFont(name: "charter black", size: 25)
        label.numberOfLines = 2
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
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        btn.layer.cornerRadius = 50
        btn.layer.borderWidth = 1
        
        return btn
    }()
    
    var savedGamesButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Saved Games", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(savedGames), for: .touchUpInside)
        btn.layer.cornerRadius = 50
        btn.layer.borderWidth = 1
        
        return btn
    }()
    
    var numOfDecksImage: UIImageView = {
        let deckImage = UIImageView()
        deckImage.image = UIImage(systemName: "1.square")
        deckImage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        deckImage.contentMode = .scaleAspectFit
        
        
        return deckImage
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "BlackJack"
        
        setupMenuLayout()
    }

    /// shuffles deck of cards player can choose how many decks 1-8
    func setupMenuLayout(){
        
        let menuStackView = UIStackView(arrangedSubviews: [textLabel, numOfDecksImage, savedGamesButton ,playButton, deckSlider])
        menuStackView.axis = .vertical
        menuStackView.distribution = .fillEqually
        menuStackView.alignment = .fill
        menuStackView.spacing = 25
        //menuStackView.frame = view.bounds.insetBy(dx: 10, dy: 100)
        //menuStackView.backgroundColor = .systemRed
        
        view.addSubview(menuStackView)
        
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        menuStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        menuStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        menuStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        
    }
    
    @objc func sliderValueChanged(){
        numberOfDecks = Int(deckSlider.value)
        var numImage = ""
        switch Int(deckSlider.value) {
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
            self.numOfDecksImage.image = UIImage(systemName: numImage)
        }
    }
    
    @objc func startGame(){
        let playVC = PlayGameViewController()
        navigationController?.pushViewController(playVC, animated: true)
    }
    
    @objc func savedGames(){
       print("saved games")
    }
    

}


