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
    // just one method to set all our elements in the view:
    func createStackView() {
        // create blank imageView:
        let imageView = UIImageView()
        // set color of background of the imageView:
        imageView.backgroundColor = .systemGreen
        // set specific image to imageView
        // here is used system file which you can find in IB:
        imageView.image = UIImage(systemName: "bell")
        // scaling our image view "масштабировать по размеру":
        imageView.contentMode = .scaleAspectFit
        // set constraints of width and height for our image view as
        imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        // changed height of the image view only to 1/3 of the super view but there is no changes in simulator:
        imageView.heightAnchor.constraint(equalToConstant: view.frame.size.height/3).isActive = true
        
        // set blank label:
        let label = UILabel()
        // define some text fo the label:
        label.text = "Hello World"
        // set background color of the label:
        label.backgroundColor = .systemBlue
        // put text in the label to the center orientation:
        label.textAlignment = .center
        // set font, size and type of the text:
        label.font = .systemFont(ofSize: 21, weight: .bold)
        // set width and height constraints for the label:
        label.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        // seems like the height is equal to 100 because we don't need a massive label
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        // set stackView with two elements:
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        // set frame of the stack view equal to view bounds (not frame)
        stackView.frame = view.bounds
        // set background color of the stackView:
        stackView.backgroundColor = .yellow
        // vertical orientation
        stackView.axis = .vertical
        // how elements should be placed inside stack view:
        stackView.distribution = .equalSpacing
        // set the distance between elements of the stack view:
        stackView.spacing = 20
        // add stack view to superView:
        view.addSubview(stackView)
    }

}

