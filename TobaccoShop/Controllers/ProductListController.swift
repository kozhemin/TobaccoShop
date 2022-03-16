//
//  ProductListViewController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 27.02.2022.
//

import UIKit

class ProductListController: UIViewController {
    lazy var productCollectionViewController = ProductCollectionViewController()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let rootNC = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = rootNC

        guard let navigationController = self.navigationController else { return }
        navigationController.setTobaccoNavTheme()

        configureUI()
        loadData()
    }

    private func configureUI() {
        view.backgroundColor = .white

        addChild(productCollectionViewController)
        view.addSubview(productCollectionViewController.view)
        productCollectionViewController.didMove(toParent: self)
        view = view
    }

    private func loadData() {
        productCollectionViewController.productList = demoProductList
    }
}
