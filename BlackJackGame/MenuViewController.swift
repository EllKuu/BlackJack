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
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        
        return btn
    }()
    
    var numOfDecksImage: UIImageView = {
        let deckImage = UIImageView()
        deckImage.image = UIImage(systemName: "1.square")
        deckImage.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        deckImage.contentMode = .scaleAspectFill
        
        
        return deckImage
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "BlackJack"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Saved Games", style: .plain, target: self, action: #selector(savedGames))
        
        setupMenuLayout()
    }

    /// shuffles deck of cards player can choose how many decks 1-8
    func setupMenuLayout(){
        
        let menuStackView = UIStackView(arrangedSubviews: [textLabel, numOfDecksImage, deckSlider, playButton])
        menuStackView.axis = .vertical
        menuStackView.distribution = .fillEqually
        menuStackView.spacing = 100
        
        view.addSubview(menuStackView)
        
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        menuStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        menuStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        menuStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        menuStackView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        
        

        
//        textLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
//        deckSlider.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 50)
//        playButton.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        
        
//        view.addSubview(textLabel)
//        view.addSubview(deckSlider)
//        view.addSubview(playButton)
        
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


