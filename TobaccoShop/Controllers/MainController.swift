//
//  MainController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 26.02.2022.
//

import SnapKit
import UIKit

class MainController: UIViewController {
    lazy var mainViewController = MainViewController()

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

    private func configureUI() {
        view.backgroundColor = .darkColor
        addChild(mainViewController)
        view.addSubview(mainViewController.view)
        mainViewController.didMove(toParent: self)

        makeConstraints()
    }

    private func makeConstraints() {
        mainViewController.view.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
        }
    }
}
