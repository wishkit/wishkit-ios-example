//
//  SceneDelegate.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 2/9/23.
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

        self.window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()

        // 1. First, configure WishList with your api-key.
        WishList.configure(with: "6629D327-970D-4AD7-A394-872EDEA6C567")
    }
}

