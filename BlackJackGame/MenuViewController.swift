//
//  ViewController.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-06.
//

import UIKit

class MenuViewController: UIViewController {
    
    var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Play", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        btn.layer.cornerRadius = 15
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
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
       
        return btn
    }()
    
    var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LogoImage")
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
        
    override func loadView() {
        super.loadView()
        view = GradientView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        view.addSubview(logoImage)
        view.addSubview(savedGamesButton)
        view.addSubview(playButton)
        
        setupMenuLayoutConstraints()
        
//        let menuStackView = UIStackView(arrangedSubviews: [ logoImage, savedGamesButton ,playButton])
//        menuStackView.axis = .vertical
//        menuStackView.distribution = .fillEqually
//        menuStackView.alignment = .fill
//        menuStackView.spacing = 25
//        view.addSubview(menuStackView)
//
//        menuStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        menuStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
//        menuStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        menuStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        menuStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        
    }
    
    private func setupMenuLayoutConstraints(){
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        savedGamesButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            logoImage.heightAnchor.constraint(equalToConstant: 250),
            
            savedGamesButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            savedGamesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            savedGamesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            playButton.topAnchor.constraint(equalTo: savedGamesButton.bottomAnchor, constant: 50),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            
            
        ])
    }
    
    @objc func startGame(){
        let playVC = PlayGameViewController()
        navigationController?.pushViewController(playVC, animated: true)
    }
    
    @objc func savedGames(){
       print("saved games")
    }
    

}


