//
//  ViewController.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 2/9/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import UIKit

// 2. Import WishKit
import WishKit

class ViewController: UIViewController {

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

        // 3. Present the WishKit view controller.
        present(WishKit.viewController, animated: true)
    }
}

