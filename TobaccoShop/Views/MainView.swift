//
//  MainView.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 26.02.2022.
//

import SnapKit
import UIKit

final class MainView: UIView {
    var routDelegate: PresentNextControllerDelegate?

    private(set) lazy var labelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main-label")
        return imageView
    }()

    private(set) lazy var smokeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg-smoke")
        return imageView
    }()

    private(set) lazy var shopNowBtn: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 25)
        btn.configuration?.title = "Shop now!"
        btn.configuration?.buttonSize = .large
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20)
        btn.addTarget(self, action: #selector(presentAppController), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    fileprivate func configureUI() {
        addSubview(labelImage)
        addSubview(smokeImage)
        addSubview(shopNowBtn)

        labelImage.snp.makeConstraints { make -> Void in
            make.centerY.lessThanOrEqualTo(self).offset(-100)
            make.centerX.lessThanOrEqualTo(self)
        }

        smokeImage.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(self).offset(100)
            make.centerX.lessThanOrEqualTo(self)
        }

        shopNowBtn.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(labelImage).offset(70)
            make.centerX.lessThanOrEqualTo(self)
            make.width.equalTo(self).multipliedBy(0.5)
        }
    }

    @objc
    private func presentAppController(sender _: UIButton) {
        routDelegate?.present(nil)
    }
}
