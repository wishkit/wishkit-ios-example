//
//  SceneDelegate.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 2/9/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import UIKit
import WishKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var scene: UIScene?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        self.scene = scene

        // 1. First, configure WishList with your api-key.
        WishKit.configure(with: "0269EE13-3390-4003-9AEA-A69ADACFAE7C")

        // Show the status badge of a wish
        WishKit.config.statusBadge = .show
        
        // Change the "+" character color on the add button.
        WishKit.config.buttons.addButton.textColor = .init(light: .white, dark: .white)

        // Change the padding beneath the add button.
        WishKit.config.buttons.addButton.bottomPadding = .large

        WishKit.theme.primaryColor = .black

        // Segmented Control
        WishKit.config.buttons.segmentedControl.defaultTextColor = Theme.Scheme(light: .white, dark: .white)

        WishKit.config.buttons.segmentedControl.activeTextColor = Theme.Scheme(light: .white, dark: .white)

        WishKit.config.buttons.saveButton.textColor = .init(light: .white, dark: .white)

        let _ = Bundle.main.appIcon
        
        // Call one of the example functions to see different ways of presenting the wishlist.
        setupNavigationExample()
    }

    /// Example that uses `present` to show the wishlist.
    private func setupSimpleExample() {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        self.window = UIWindow(windowScene: windowScene)

        // It just works ✨
        window?.rootViewController = ViewController()

        window?.makeKeyAndVisible()
    }

    /// Example that uses `navigationController.push` to show the wishlist.
    private func setupNavigationExample() {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        self.window = UIWindow(windowScene: windowScene)

        // It just works ✨
        window?.rootViewController = UINavigationController(rootViewController: NavigationExampleVC())

        window?.makeKeyAndVisible()
    }

    /// Example that uses a `UITabBarcontroller` to show the wishlist.
    private func setupTabBarExample() {
        let tabVC = UITabBarController()
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = .secondarySystemBackground
        tabVC.tabBar.standardAppearance = tabAppearance

        if #available(iOS 15, *) {
            tabVC.tabBar.scrollEdgeAppearance = tabAppearance
        }

        // It just works ✨
        tabVC.viewControllers = [WishKit.viewController]

        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        self.window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
    }
}

