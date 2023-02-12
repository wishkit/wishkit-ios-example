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
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        WishList.configure(with: "uun1qu3-4p1-k3y")
    }
}

