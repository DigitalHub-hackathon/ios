//
//  UIView+shadow.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit

extension UIView {
    
    func makeShadow(radius: CGFloat, color: UIColor, opacity: Float) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = radius
    }
    
}
