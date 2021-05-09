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
        label.text = "BlackJack"
        label.font = UIFont(name: "charter black", size: 25)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    
    var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Play", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        btn.layer.cornerRadius = 50
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
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
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        return btn
    }()
    
    var numOfDecksImage: UIImageView = {
        let deckImage = UIImageView()
        deckImage.image = UIImage(systemName: "rectangle.on.rectangle")
        deckImage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        deckImage.contentMode = .scaleAspectFit
        deckImage.tintColor = .black
        
        
        return deckImage
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "BlackJack"
        navigationController?.navigationBar.barTintColor = .green
        
        setupMenuLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    /// shuffles deck of cards player can choose how many decks 1-8
    func setupMenuLayout(){
        
        let menuStackView = UIStackView(arrangedSubviews: [textLabel, numOfDecksImage, savedGamesButton ,playButton])
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
    
    @objc func startGame(){
        let playVC = PlayGameViewController()
        navigationController?.pushViewController(playVC, animated: true)
    }
    
    @objc func savedGames(){
       print("saved games")
    }
    

}


