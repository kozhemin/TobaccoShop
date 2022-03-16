//
//  ProductDetailController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 18.03.2022.
//

import UIKit

class ProductDetailController: UIViewController {
    lazy var detailViewController = ProductDetailViewController()

    let scrollView = UIScrollView()
    let contentView = UIView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }

    func displayProduct(_ product: Product) {
        detailViewController.fillData(product: product)
    }

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.alwaysBounceVertical = true

        addChild(detailViewController)
        contentView.addSubview(detailViewController.view)
        detailViewController.didMove(toParent: self)

        makeConstraints()
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
        }

        detailViewController.view.snp.makeConstraints { make -> Void in
            make.edges.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
}
