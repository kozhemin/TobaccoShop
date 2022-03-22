//
//  UIButton+Ext.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 12.03.2022.
//

import UIKit

extension UIButton {
    func themeDefault(fontSize: CGFloat = 10) -> UIButton {
        let btn = self
        var config = UIButton.Configuration.filled()

        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)
            outgoing.foregroundColor = .white
            return outgoing
        }

        config.buttonSize = .small

        var background = UIButton.Configuration.filled().background
        background.cornerRadius = 0
        background.backgroundColor = .pinkColor
        background.strokeColor = .pinkColor

        config.background = background
        btn.configuration = config
        return btn
    }

    func themePink(fontSize: CGFloat = 10) -> UIButton {
        let btn = self
        var config = UIButton.Configuration.filled()

        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)
            outgoing.foregroundColor = .pinkColor
            return outgoing
        }

        let heartIcon = UIImage(systemName: "suit.heart")

        config.imagePlacement = .leading
        config.imagePadding = 3
        config.image = heartIcon
        config.buttonSize = .small
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: fontSize - 2)
        config.imageColorTransformer = UIConfigurationColorTransformer { _ in
            .pinkColor!
        }

        var background = UIButton.Configuration.filled().background
        background.cornerRadius = 0
        background.backgroundColor = UIColor.white
        background.strokeColor = .pinkColor

        config.background = background
        btn.configuration = config
        return btn
    }
}
