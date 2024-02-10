//
//  CustomButton.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    override var isEnabled: Bool {
        didSet {
            setupButton()
        }
    }
    
    private func setupButton() {
        backgroundColor = .clear
        tintColor = .clear
        layer.cornerRadius = frame.height / 2
        
        if isEnabled {
            layer.borderWidth = 1.0
            layer.borderColor = UIColor.white.cgColor
            setTitleColor(UIColor.white, for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        } else {
            layer.borderWidth = 0.8
            layer.borderColor = UIColor.init(white: 1, alpha: 0.2).cgColor
            setTitleColor(UIColor.init(white: 1, alpha: 0.2), for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
        }
    }
}
