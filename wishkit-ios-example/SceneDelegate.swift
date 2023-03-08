//
//  SceneDelegate.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 2/9/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import UIKit
import WishKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard
            let windowScene = (scene as? UIWindowScene)
        else {
            return
        }

        // 1. First, configure WishList with your api-key.
        WishKit.configure(with: "0269EE13-3390-4003-9AEA-A69ADACFAE7C")

        // Enable status badge.
        WishKit.configuration = Configuration(showStatusBadge: true)

        // Call one of the example functions to see different ways of presenting the wishlist.
        setupNavigationExample(windowScene: windowScene)
    }

    /// Example that uses `present` to show the wishlist.
    private func setupSimpleExample(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)

        // It just works ✨
        window?.rootViewController = ViewController()

        window?.makeKeyAndVisible()
    }

    /// Example that uses `navigationController.push` to show the wishlist.
    private func setupNavigationExample(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)

        // It just works ✨
        window?.rootViewController = UINavigationController(rootViewController: WishKit.viewController)

        window?.makeKeyAndVisible()
    }

    /// Example that uses a `UITabBarcontroller` to show the wishlist.
    private func setupTabBarExample(windowScene: UIWindowScene) {
        let tabVC = UITabBarController()
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = .secondarySystemBackground
        tabVC.tabBar.standardAppearance = tabAppearance
        tabVC.tabBar.scrollEdgeAppearance = tabAppearance

        // It just works ✨
        tabVC.viewControllers = [WishKit.viewController]

        self.window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
    }
}

