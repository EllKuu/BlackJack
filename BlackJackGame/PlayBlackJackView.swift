//
//  PlayBlackJackView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-11.
//

import UIKit

protocol PlayBlackJackProtocol: NSObjectProtocol {
    func dealCards()
}

class PlayBlackJackView: UIView {

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

        return imgView
    }()
    
    lazy var guideBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Info", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(stay), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return btn
    }()
    
    lazy var innerGameInfoStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [deckImage, guideBtn])
        sv.axis = .horizontal
        sv.distribution = .equalCentering
        sv.layer.borderWidth = 1
        sv.spacing = 50
        
        return sv
    }()
    
    lazy var gameInfoStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [informationLabel, scoreLabel, innerGameInfoStackView])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    // BlackJack Hands
    
    lazy var dealersHandImages: UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(named: "Jack-S")
        //imgView.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .clear
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        //imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        return imgView
    }()
    
    lazy var dealersHandStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 5
        sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var playersHandStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.layer.borderWidth = 1
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
        btn.addTarget(self, action: #selector(stay), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        return btn
    }()
    
    lazy var actionButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [stayBtn, hitBtn])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.layer.borderWidth = 1
        
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
        
    }
    
    @objc func hit(){
        
    }
    

}
