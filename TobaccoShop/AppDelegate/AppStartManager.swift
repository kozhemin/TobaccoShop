//
//  AppStartManager.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 18.03.2022.
//
import UIKit

final class AppStartManager {
    var window: UIWindow?
    var windowScene: UIWindowScene

    init(window: UIWindow?, windowScene: UIWindowScene) {
        self.window = window
        self.windowScene = windowScene
    }

    func start() {
        let rootVC = MainViewController()

        let navVC = configuredNavigationController
        navVC.viewControllers = [rootVC]

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        return navVC
    }()
}
