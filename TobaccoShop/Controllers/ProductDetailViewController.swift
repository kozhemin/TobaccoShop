//
//  ProductDetailViewController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 18.03.2022.
//

import UIKit

class ProductDetailViewController: UIViewController {
    private var productDetailView: ProductDetailView {
        return view as! ProductDetailView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()

        let view = ProductDetailView()
        view.routDelegate = self
        self.view = view
    }

    func fillData(product: Product) {
        productDetailView.configure(product: product)
    }
}

extension ProductDetailViewController: PresentNextControllerDelegate {
    func present(_: Any?) {
        navigationController?.popViewController(animated: true)
    }
}
