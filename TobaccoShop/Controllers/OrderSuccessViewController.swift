//
//  OrderSuccessViewController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 22.03.2022.
//

import UIKit

class OrderSuccessViewController: UIViewController {
    private var orderSuccessView: OrderSuccessView {
        return view as! OrderSuccessView
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

        let view = OrderSuccessView()
        view.routDelegate = self
        self.view = view
    }
}

extension OrderSuccessViewController: PresentNextControllerDelegate {
    func present(_: Any?) {
        navigationController?.popViewController(animated: true)
    }
}
