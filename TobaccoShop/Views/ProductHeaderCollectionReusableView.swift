//
//  ProductHeaderCollectionReusableView.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 15.03.2022.
//

import UIKit

final class ProductHeaderCollectionReusableView: UICollectionReusableView {
    let sizeInset: CGFloat = 10
    static let collectionViewHeaderFooterReuseIdentifier = "ProductHeaderFooterClass"

    lazy var exitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Exit", for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        return btn
    }()

    lazy var filterButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Filter", for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        return btn
    }()

    lazy var trendingLabel: UILabel = {
        let label = UILabel()
        label.text = "trending".uppercased()
        label.textColor = .pinkColor
        label.font = UIFont(name: "Helvetica", size: 10)
        return label
    }()

    lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot deals"
        label.textColor = .pinkColor
        label.font = UIFont(name: "Helvetica", size: 24)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    func configureUI() {
        addSubview(exitButton)
        addSubview(filterButton)
        addSubview(trendingLabel)
        addSubview(captionLabel)

        exitButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self).inset(sizeInset)
        }

        filterButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self).inset(sizeInset)
        }

        trendingLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(exitButton.snp.bottom).offset(20)
        }

        captionLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(trendingLabel.snp.bottom).offset(5)
        }
    }
}
