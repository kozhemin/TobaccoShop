//
//  MainViewController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 26.02.2022.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    var routDelegate: PresentNextControllerDelegate?
    private var appLaunchView: MainView {
        return view as! MainView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        let view = MainView()
        view.routDelegate = self
        self.view = view
    }
}

extension MainViewController: PresentNextControllerDelegate {
    func present(_: Any?) {
        let vc = ProductListController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
