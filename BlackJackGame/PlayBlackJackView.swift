//
//  PlayBlackJackView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-11.
//

import UIKit

protocol PlayBlackJackProtocol: NSObjectProtocol {
  
    func dealHand()
    
    func playerHit()
    
    func playerStay()
    
    func newHand()
    
    
    func probabilityGuide()
}

class PlayBlackJackView: UIView {
    
    weak var playBlackJackDelegate: PlayBlackJackProtocol? = nil

    // Game Information
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Game Information"
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Wins: / Losses: "
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var deckImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "CardBack")
        
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .clear
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dealHand)))
        imgView.isUserInteractionEnabled = true

        return imgView
    }()
    
    lazy var guideBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Guide", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(probabilityGuide), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return btn
    }()
    
    lazy var innerGameInfoStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [deckImage])
        sv.axis = .horizontal
        sv.distribution = .equalCentering
        //sv.layer.borderWidth = 1
        sv.spacing = 50
        
        return sv
    }()
    
    lazy var gameInfoStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [scoreLabel, informationLabel,  innerGameInfoStackView])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        //sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    // BlackJack Hands
    
    lazy var dealersHandStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 5
        //sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var playersHandStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        //sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var cardHandsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [ dealersHandStackView, playersHandStackView])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.layer.borderWidth = 1
        sv.spacing = 10
        return sv
    }()
    
    // Action Buttons
    
    lazy var stayBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Stay", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(stay), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
     
        return btn
    }()
    
    lazy var hitBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Hit", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(hit), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        return btn
    }()
    
    lazy var newHandBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("New Hand", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(newHand), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    lazy var actionButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [newHandBtn, stayBtn, hitBtn])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        //sv.layer.borderWidth = 1
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    private func setupView(){
        addSubview(gameInfoStackView)
        addSubview(dealersHandStackView)
        addSubview(playersHandStackView)
        addSubview(actionButtonStackView)
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            gameInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            gameInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            gameInfoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            
            dealersHandStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dealersHandStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            dealersHandStackView.topAnchor.constraint(equalTo: gameInfoStackView.bottomAnchor, constant: 50),
            
            playersHandStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            playersHandStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            playersHandStackView.topAnchor.constraint(equalTo: dealersHandStackView.bottomAnchor, constant: 50),
            
            actionButtonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            actionButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            actionButtonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),

            
            
        ])
    }
    
    @objc func stay(){
        self.playBlackJackDelegate?.playerStay()
    }
    
    @objc func hit(){
        self.playBlackJackDelegate?.playerHit()
        
    }
    
    @objc func dealHand(){
        self.playBlackJackDelegate?.dealHand()
    }
    
    @objc func probabilityGuide(){
        self.playBlackJackDelegate?.probabilityGuide()
    }
    
    @objc func newHand(){
        self.playBlackJackDelegate?.newHand()
    }
    

}
