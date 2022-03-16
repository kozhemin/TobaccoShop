//
//  UIView+Ext.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 08.03.2022.
//

import UIKit

extension UIView {
    func clip(
        cornerRadius: CGFloat = 50.0,
        borderWidth: CGFloat = 1.0,
        borderColor: CGColor = UIColor.lightGray.cgColor
    ) {
        let layer = self.layer
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }

    func addShadow(
        cornerRadius: CGFloat = 50.0,
        shadowColor: CGColor = UIColor.lightGray.cgColor,
        shadowRadius: CGFloat = 5.0,
        shadowOpacity: Float = 0.6
    ) {
        let layer = self.layer
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor
        layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
