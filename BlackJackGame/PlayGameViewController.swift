//
//  PlayGameViewController.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-05-06.
//

import UIKit


class PlayGameViewController: UIViewController {
    
    
    var numberOfDecks: Int?
    
    
    
    var selectNumberOfDecks = NumberOfDecksView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        navigationController?.navigationBar.barTintColor = .red
        setupMenuLayout()
    }
    
    func setupMenuLayout(){
        
        
        let s = selectNumberOfDecks.setupMenuLayout()
        view.addSubview(s)
        s.translatesAutoresizingMaskIntoConstraints = false
        s.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        s.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        s.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        s.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        
        
        
    }
    
    
    @objc func sliderValueChanged(){
        self.selectNumberOfDecks.sliderValueChanged()
        numberOfDecks = Int(selectNumberOfDecks.deckSlider.value)
    }
    
    @objc func startGame(){
        print("play animation")
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.selectNumberOfDecks.startGame()
        }
        print(numberOfDecks)
    }
    
    
}
