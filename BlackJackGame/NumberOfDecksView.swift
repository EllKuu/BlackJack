//
//  NumberOfDecksView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-09.
//

import UIKit

protocol NumberOfDecksProtocol: NSObjectProtocol {
    func sliderValueChanged()
    
    func gameStart()
}

class NumberOfDecksView: UIView{

    weak var numberOfDecksDelegate: NumberOfDecksProtocol? = nil
    
    let gradientLayer = CAGradientLayer()
    let lightGreen = UIColor(hex: "#4bf2c3ff")?.cgColor
    let darkBlue = UIColor(hex: "#161c40ff")?.cgColor
    
        
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "How many decks would you like to play with?"
        label.font = UIFont(name: "Bungee-Regular", size: 25)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    lazy var deckSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue  = 8
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.tintColor = .black
        return slider
    }()
    
   lazy var numOfDecksImage: UIImageView = {
        let deckImage = UIImageView()
        deckImage.image = UIImage(systemName: "1.square")
        deckImage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        deckImage.contentMode = .scaleAspectFit
        deckImage.tintColor = .black
        
        
        return deckImage
    }()
    
    lazy var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Start", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.titleLabel?.font = UIFont(name: "Bungee-Regular", size: 25)
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 1
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.setTitleColor(.black, for: .normal)
        
        return btn
    }()
    
    lazy var menuStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [textLabel, numOfDecksImage, deckSlider, playButton])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 25
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
        gradientLayer.colors = [lightGreen, darkBlue] as! [CGColor]
        layer.addSublayer(gradientLayer)
        addSubview(menuStackView)
        setupLayout()
    }
    
    
    func setupLayout(){
        
        
        NSLayoutConstraint.activate([
            menuStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            menuStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            menuStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            menuStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])

    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
        
    }
    

    
    
    @objc func sliderValueChanged(){
        self.numberOfDecksDelegate?.sliderValueChanged()

    }
    
    @objc func startGame(){
        self.numberOfDecksDelegate?.gameStart()
    }
    
    

}
