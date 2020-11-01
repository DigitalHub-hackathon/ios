//
//  UIView+roundCorner.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import UIKit

extension UIView {
    
    func roundCorner(corners: [RectCorner], radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        var cornerMask = CACornerMask()
        for corner in corners {
            cornerMask.insert(corner.cornerMask)
        }
        self.layer.maskedCorners = cornerMask
    }
    
    enum RectCorner {
        case bottomLeft
        case bottomRigth
        case topRight
        case topLeft
        
        var cornerMask: CACornerMask {
            switch self {
            case .topLeft:
                return .layerMinXMinYCorner
            case .topRight:
                return .layerMaxXMinYCorner
            case .bottomLeft:
                return .layerMinXMaxYCorner
            case .bottomRigth:
                return .layerMaxXMaxYCorner
            }
        }
    }
    
}
