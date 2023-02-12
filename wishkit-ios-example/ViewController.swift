//
//  ViewController.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 2/9/23.
//

import UIKit

// 2. Import WishKit
import WishKit

class ViewController: UIViewController {

    let showButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupShowButton()
    }

    func setupShowButton() {
        view.addSubview(showButton)

        showButton.setTitle("Show Wishlist", for: .normal)
        showButton.setTitleColor(.white, for: .normal)
        showButton.addTarget(self, action: #selector(showWishList), for: .touchUpInside)
        showButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showWishList() {

        // 3. Present the WishList ViewController.
        navigationController?.pushViewController(WishList.viewController, animated: true)
    }
}

