//
//  NavigationController+Ext.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 28.02.2022.
//

import UIKit

let navigationImageView = UIImageView(image: UIImage(named: "navigation-logo"))

public extension UINavigationController {
    func setTobaccoNavTheme() {
        UINavigationBar.appearance().backgroundColor = .darkColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false

        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationBar.addSubview(navigationImageView)

        navigationImageView.contentMode = .scaleAspectFit
        navigationImageView.snp.makeConstraints { make -> Void in
            make.leading.equalTo(navigationBar).offset(10)
            make.top.equalTo(navigationBar.snp.top)
            make.height.equalTo(navigationBar.snp.height).offset(-5)
        }

        let style = UINavigationBarAppearance()
        style.backgroundColor = .darkColor

        navigationBar.scrollEdgeAppearance = style
        navigationBar.standardAppearance = style
        navigationBar.compactAppearance = style
    }
}
