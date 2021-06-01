//
//  GradientView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-06-01.
//

import UIKit

class GradientView: UIView {

    let gradientLayer = CAGradientLayer()
   
    let lightGreen = UIColor(hex: "#4bf2c3ff")?.cgColor
    let darkBlue = UIColor(hex: "#161c40ff")?.cgColor

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        gradientLayer.colors = [
            darkBlue,
            lightGreen
        ]
        layer.addSublayer(gradientLayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }

}
