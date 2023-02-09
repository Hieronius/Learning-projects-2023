//
//  ViewController.swift
//  StackViewPractice
//
//  Created by Арсентий Халимовский on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
        
    }

    func createStackView() {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.image = UIImage(systemName: "bell")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView])
        stackView.frame = view.bounds
        view.addSubview(stackView)
    }

}

