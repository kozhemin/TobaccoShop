//
//  OrderSuccessView.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 22.03.2022.
//

import SnapKit
import UIKit

final class OrderSuccessView: UIView {
    var routDelegate: PresentNextControllerDelegate?

    private(set) lazy var labelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main-label")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private(set) lazy var orderAcknowledgmentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "OrderAcknowledgment")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var orderInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 14)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Congratulations! We have reviewed your order information and will proceed with your order!"
        return label
    }()

    private(set) lazy var shopMoreBtn: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 18)
        btn.configuration?.title = "Shop more!"
        btn.configuration?.buttonSize = .large
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        btn.addTarget(self, action: #selector(presentPrevController), for: .touchUpInside)
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
        addSubview(orderAcknowledgmentImage)
        addSubview(orderInfoLabel)
        addSubview(shopMoreBtn)

        labelImage.snp.makeConstraints { make -> Void in
            make.top.equalTo(self).offset(150)
            make.centerX.lessThanOrEqualTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
        }

        orderAcknowledgmentImage.snp.makeConstraints { make -> Void in
            make.top.equalTo(labelImage.snp.bottom).offset(30)
            make.centerX.lessThanOrEqualTo(self)
            make.width.equalTo(self).multipliedBy(0.7)
        }

        orderInfoLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(orderAcknowledgmentImage.snp.bottom).offset(20)
            make.centerX.lessThanOrEqualTo(self)
            make.width.equalTo(orderAcknowledgmentImage.snp.width)
        }

        shopMoreBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(orderInfoLabel.snp.bottom).offset(30)
            make.centerX.lessThanOrEqualTo(self)
            make.width.equalTo(200)
        }
    }

    @objc
    private func presentPrevController(sender _: UIButton) {
        routDelegate?.present(nil)
    }
}
