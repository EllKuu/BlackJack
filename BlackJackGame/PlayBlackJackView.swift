//
//  PlayBlackJackView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-11.
//

import UIKit

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
        imgView.image = UIImage(systemName: "house")
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.widthAnchor.constraint(equalToConstant: 100).isActive = true

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
        imgView.image = UIImage(systemName: "house.fill")
        imgView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .black
        imgView.clipsToBounds = true
        
        return imgView
    }()
    
    lazy var playersHandImages: UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(systemName: "r.joystick")
        imgView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.clipsToBounds = true
        
        
        return imgView
    }()
    
    lazy var playersHandImages1: UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(systemName: "r.joystick")
        imgView.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.clipsToBounds = true
        
        
        return imgView
    }()
    
    lazy var dealersHandStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [playersHandImages1, dealersHandImages])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var playersHandStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [playersHandImages, dealersHandImages])
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.spacing = 10
        sv.layer.borderWidth = 1
        sv.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return btn
    }()
    
    lazy var actionButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [stayBtn, hitBtn])
        sv.axis = .horizontal
        sv.distribution = .equalCentering
        sv.spacing = 10
        sv.layer.borderWidth = 1
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return sv
    }()
    
    
    lazy var fullViewStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [gameInfoStackView, dealersHandStackView, playersHandStackView, actionButtonStackView])
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.layer.borderWidth = 5
        
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
        addSubview(fullViewStackView)
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            fullViewStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fullViewStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            fullViewStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            fullViewStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            
            
           
            
//            playersHandStackView.heightAnchor.constraint(equalToConstant: fullViewStackView.frame.height),
//            playersHandStackView.widthAnchor.constraint(equalToConstant: fullViewStackView.frame.width),
//            playersHandStackView.centerYAnchor.constraint(equalTo: fullViewStackView.centerYAnchor),
//            playersHandStackView.centerXAnchor.constraint(equalTo: fullViewStackView.centerXAnchor),
//
//            dealersHandStackView.heightAnchor.constraint(equalToConstant: fullViewStackView.frame.height),
//            dealersHandStackView.widthAnchor.constraint(equalToConstant: fullViewStackView.frame.width),
//            dealersHandStackView.centerYAnchor.constraint(equalTo: fullViewStackView.centerYAnchor),
//            dealersHandStackView.centerXAnchor.constraint(equalTo: fullViewStackView.centerXAnchor),
//
        ])
    }
    
    @objc func stay(){
        
    }
    
    @objc func hit(){
        
    }
    

}
