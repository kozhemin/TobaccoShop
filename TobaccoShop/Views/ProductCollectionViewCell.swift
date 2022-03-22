//
//  ProductCollectionViewCell.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 02.03.2022.
//
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    var routDelegate: PresentNextControllerDelegate?
    var product: Product?

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

    lazy var footerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var wishlistButton: UIButton = {
        let btn = UIButton(type: .system).themePink()
        btn.configuration?.title = "Wishlist"
        btn.addTarget(self, action: #selector(presentOrderSuccessController), for: .touchUpInside)
        return btn
    }()

    lazy var addToCartButton: UIButton = {
        let btn = UIButton(type: .system).themeDefault()
        btn.configuration?.title = "Add to cart"
        btn.addTarget(self, action: #selector(presentDetailController), for: .touchUpInside)
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
        let sizeInset = 5
        let footerHeight: CGFloat = 100

        contentView.addSubview(imageView)
        contentView.addSubview(footerView)
        footerView.addSubview(productDescriptionLabel)
        footerView.addSubview(productPriceLabel)
        footerView.addSubview(wishlistButton)
        footerView.addSubview(addToCartButton)

        imageView.snp.makeConstraints { make -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: footerHeight, right: 0))
        }

        footerView.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(contentView.snp.bottom)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(footerHeight)
        }

        productDescriptionLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(footerView.snp.top)
            make.leading.equalTo(footerView).inset(sizeInset)
            make.trailing.equalTo(footerView).inset(sizeInset)
            make.height.equalTo(50)
        }

        productPriceLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(footerView).inset(sizeInset)
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(15)
        }

        wishlistButton.snp.makeConstraints { make -> Void in
            make.trailing.equalTo(footerView).inset(sizeInset)
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(5)
            make.width.equalTo(footerView).multipliedBy(0.5)
        }

        addToCartButton.snp.makeConstraints { make -> Void in
            make.trailing.equalTo(footerView).inset(sizeInset)
            make.top.equalTo(wishlistButton.snp.bottom).offset(3)
            make.width.equalTo(footerView).multipliedBy(0.5)
        }
    }

    @objc
    private func presentDetailController(sender _: UIButton) {
        routDelegate?.present(product)
    }

    @objc
    private func presentOrderSuccessController(sender _: UIButton) {
        routDelegate?.present(nil)
    }
}

extension ProductCollectionViewCell {
    func configure(product: Product) {
        self.product = product

        imageView.image = UIImage(named: product.imageName)
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "$\(product.price)"
    }
}
