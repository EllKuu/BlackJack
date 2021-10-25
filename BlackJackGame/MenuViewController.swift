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
        btn.titleLabel?.font = UIFont(name: "Bungee-Regular", size: 30)
        btn.setTitleColor(.black, for: .normal)
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
        btn.titleLabel?.font = UIFont(name: "Bungee-Regular", size: 30)
        btn.setTitleColor(.black, for: .normal)
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
    
    let lightGreen = UIColor(hex: "#4bf2c3ff")?.cgColor
    let darkBlue = UIColor(hex: "#161c40ff")?.cgColor
    let lightYellow = UIColor(hex: "#f2b705ff")?.cgColor
    let darkYellow = UIColor(hex: "#f29f05ff")?.cgColor
        
    override func loadView() {
        super.loadView()
        let colors = [lightGreen, darkBlue ]
        view = GradientView(frame: .zero, colors: colors as! [CGColor])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuLayout()
        savedGamesButton.isHidden = true
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
    
    override func viewDidLayoutSubviews() {
        savedGamesButton.applyGradient(colors: [lightYellow!, darkYellow!])
        playButton.applyGradient(colors: [lightYellow!, darkYellow!])
    }
    

    /// shuffles deck of cards player can choose how many decks 1-8
    func setupMenuLayout(){
        
        view.addSubview(logoImage)
        view.addSubview(savedGamesButton)
        view.addSubview(playButton)
        
        
        
        setupMenuLayoutConstraints()
        
    }
    
    private func setupMenuLayoutConstraints(){
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        savedGamesButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            logoImage.heightAnchor.constraint(equalToConstant: 400),
            
            savedGamesButton.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -30),
            savedGamesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            savedGamesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            savedGamesButton.heightAnchor.constraint(equalToConstant: 100),
            
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            playButton.heightAnchor.constraint(equalToConstant: 100)
            
            
            
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


