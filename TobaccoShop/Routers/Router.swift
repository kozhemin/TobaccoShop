//
//  Router.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 27.02.2022.
//
import UIKit

protocol Router {
    func present(_ vc: UIViewController, animated: Bool)
    func push(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?)
}
