//
//  NumberOfDecksView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-09.
//

import UIKit


class NumberOfDecksView: UIStackView{


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
        slider.tintColor = .black
        return slider
    }()
    
    var numOfDecksImage: UIImageView = {
        let deckImage = UIImageView()
        deckImage.image = UIImage(systemName: "1.square")
        deckImage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        deckImage.contentMode = .scaleAspectFit
        deckImage.tintColor = .black
        
        
        return deckImage
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
    
    var menuStackView = UIStackView()
    
    func setupMenuLayout() -> UIStackView{
        
        
        menuStackView = UIStackView(arrangedSubviews: [textLabel, numOfDecksImage, deckSlider, playButton])
        menuStackView.axis = .vertical
        menuStackView.distribution = .fillEqually
        menuStackView.alignment = .fill
        menuStackView.spacing = 25
        
        return menuStackView
       
    }
    
    
    @objc func sliderValueChanged(){
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
       print("play animation")
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
//            self.textLabel.transform = CGAffineTransform(translationX: 0, y: -200)
//            self.textLabel.alpha = 0
            self.menuStackView.transform = CGAffineTransform(translationX: 0, y: -200)
            self.menuStackView.alpha = 0
            
        }
//        completion: { (_) in
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
//
//                self.textLabel.alpha = 0
//                self.textLabel.transform = self.textLabel.transform.translatedBy(x: 0, y: -200)
//            }
//        }
        
        
//        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
//
//            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
//
//        } completion: { (_) in
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
//
//                self.bodyLabel.alpha = 0
//                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
//            }
//        }
        
        
    }

}
