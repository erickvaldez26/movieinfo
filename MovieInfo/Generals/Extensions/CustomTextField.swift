//
//  CustomTextField.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

class CustomTextField: UITextField {
    let padding = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func drawPlaceholder(in rect: CGRect) {
        guard let placeholder = placeholder, !placeholder.isEmpty else {
            super.drawPlaceholder(in: rect)
            return
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.init(white: 1, alpha: 0.2),
            .font: font ?? UIFont.systemFont(ofSize: 13, weight: .regular)
        ]
        
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        attributedPlaceholder.draw(in: rect)
    }
    
    private func setupTextField() {
        backgroundColor = UIColor(red: 46 / 255, green: 46 / 255, blue: 44 / 255, alpha: 1)
        layer.cornerRadius = frame.height / 2
        layer.backgroundColor = UIColor(red: 46 / 255, green: 46 / 255, blue: 44 / 255, alpha: 1).cgColor
        
        tintColor = UIColor.white
        textColor = UIColor.white
        font =  UIFont.systemFont(ofSize: 13, weight: .regular)
        
        autocorrectionType = .no
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.mask = maskLayer
    }
}
