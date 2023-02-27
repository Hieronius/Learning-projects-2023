//
//  ViewController.swift
//  imageViewLoadPractice
//
//  Created by Арсентий Халимовский on 27.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let urlImage = URL(string: "https://media.istockphoto.com/photos/generic-red-suv-on-a-white-background-side-view-picture-id1157655660?b=1&k=20&m=1157655660&s=612x612&w=0&h=ekNZlV17a3wd_yN9PhHXtIabO_zFo4qipCy2AZRpWUI=")
    let urlStringImage = "https://media.istockphoto.com/photos/generic-red-suv-on-a-white-background-side-view-picture-id1157655660?b=1&k=20&m=1157655660&s=612x612&w=0&h=ekNZlV17a3wd_yN9PhHXtIabO_zFo4qipCy2AZRpWUI="
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testImage.load(url: urlImage!)
        secondImage.loadImage(urlString: urlStringImage)
        print("loading is done")
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
