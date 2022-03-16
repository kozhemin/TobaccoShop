//
//  ProductDetailView.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 18.03.2022.
//

import SnapKit
import UIKit

final class ProductDetailView: UIView {
    var routDelegate: PresentNextControllerDelegate?
    let sizeInset: CGFloat = 20

    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.addTarget(self, action: #selector(presentPrevController), for: .touchUpInside)
        return btn
    }()

    lazy var filterButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Filter", for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        return btn
    }()

    lazy var breadcrumbLabel: UILabel = {
        let label = UILabel()
        label.text = "TOBACCO / TRENDING / HOT DEALS".uppercased()
        label.textColor = .pinkColor
        label.font = UIFont(name: "Helvetica", size: 10)
        return label
    }()

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()

    lazy var producnNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()

    lazy var wishlistButton: UIButton = {
        let btn = UIButton(type: .system).themePink(fontSize: 16)
        btn.configuration?.title = "Wishlist"
        btn.configuration?.buttonSize = .large
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        return btn
    }()

    lazy var addToCartButton: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 16)
        btn.configuration?.title = "Add to cart"
        btn.configuration?.buttonSize = .large
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return btn
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    fileprivate func configureUI() {
        addSubview(backButton)
        addSubview(filterButton)
        addSubview(breadcrumbLabel)
        addSubview(imageView)
        addSubview(producnNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(productPriceLabel)
        addSubview(wishlistButton)
        addSubview(addToCartButton)

        backButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self).inset(sizeInset)
        }

        filterButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self).inset(sizeInset)
        }

        breadcrumbLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(backButton.snp.bottom).offset(20)
        }

        imageView.snp.makeConstraints { make -> Void in
            make.top.equalTo(breadcrumbLabel.snp.bottom).offset(20)
            make.width.equalTo(self.snp.width).offset(-sizeInset)
            make.height.equalTo(self.snp.width).offset(-sizeInset * 2.5)
            make.center.equalTo(self)
        }

        producnNameLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }

        productDescriptionLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.trailing.equalTo(self).inset(sizeInset)
            make.top.equalTo(producnNameLabel.snp.bottom).offset(20)
        }

        productPriceLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(15)
        }

        wishlistButton.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(productPriceLabel.snp.bottom).offset(sizeInset)
            make.width.equalTo(self).multipliedBy(0.5)
        }

        addToCartButton.snp.makeConstraints { make -> Void in
            make.trailing.equalTo(self).inset(sizeInset)
            make.top.equalTo(productPriceLabel.snp.bottom).offset(sizeInset)
            make.width.equalTo(self).multipliedBy(0.5)
        }
    }

    @objc
    private func presentPrevController(sender _: UIButton) {
        routDelegate?.present(nil)
    }
}

extension ProductDetailView {
    func configure(product: Product) {
        imageView.image = UIImage(named: product.imageName)
        producnNameLabel.text = "Carolina Cigar 25ct Cabinet Selection"
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "$\(product.price)"
    }
}
