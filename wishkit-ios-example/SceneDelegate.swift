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

        // Hide the segmented control (Requested/Implemented)
        WishKit.config.buttons.segmentedControl.display = .hide

        // Set the secondary color (this is for the cells and text fields).
        WishKit.theme.secondaryColor = Theme.Scheme(light: .yellow.opacity(1/3), dark: .white.opacity(1/3))

        // Set the tertiary color (this is for the background).
        WishKit.theme.tertiaryColor = Theme.Scheme(light: .purple, dark: .blue)

        // Change any text used by wishkit (assign localized strings to support different languages).
        WishKit.config.localization.requested = "New"

        let _ = Bundle.main.appIcon
        
        // Call one of the example functions to see different ways of presenting the wishlist.
        setupSimpleExample()
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
        window?.rootViewController = UINavigationController(rootViewController: WishKit.viewController)

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

