//
//  OrderSuccessController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 22.03.2022.
//

import UIKit

class OrderSuccessController: UIViewController {
    lazy var orderSuccessController = OrderSuccessViewController()

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
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func configureUI() {
        view.backgroundColor = .darkColor

        addChild(orderSuccessController)
        view.addSubview(orderSuccessController.view)
        orderSuccessController.didMove(toParent: self)

        makeConstraints()
    }

    private func makeConstraints() {
        orderSuccessController.view.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
        }
    }
}
