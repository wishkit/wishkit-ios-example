//
//  NavigationExampleVC.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 7/29/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import UIKit

// 2. Import WishKit
import WishKit

class NavigationExampleVC: UIViewController {

    let showButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupShowButton()
    }

    func setupShowButton() {
        view.addSubview(showButton)

        showButton.setTitle("Show Wishlist", for: .normal)
        showButton.setTitleColor(.black, for: .normal)
        showButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        showButton.addTarget(self, action: #selector(showWishList), for: .touchUpInside)
        showButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showWishList() {

        let vc = WishKit.viewController

        let app = UINavigationBarAppearance()
        app.backgroundColor = .black

        app.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        vc.navigationController?.navigationBar.isTranslucent = true
        vc.navigationController?.navigationBar.standardAppearance = app
        vc.navigationController?.navigationBar.scrollEdgeAppearance = app

        // 3. Present the WishKit view controller.
        navigationController?.pushViewController(vc, animated: true)
    }
}


