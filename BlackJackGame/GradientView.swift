//
//  GradientView.swift
//  BlackJackGame
//
//  Created by elliott kung on 2021-06-01.
//

import UIKit

class GradientView: UIView {

    let gradientLayer = CAGradientLayer()
    
    var colorsArr: [CGColor]

    init(frame: CGRect, colors: [CGColor]){
        self.colorsArr = colors
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commonInit(){
        gradientLayer.colors = colorsArr
        layer.addSublayer(gradientLayer)
    }

    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }

}
