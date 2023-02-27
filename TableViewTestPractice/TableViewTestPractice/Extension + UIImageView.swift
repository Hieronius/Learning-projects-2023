//
//  Extension + UIImageView.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 27.02.2023.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        // load images in background
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    // define our image in main thread
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIImageView {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
