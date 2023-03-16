//
//  LikeButton.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 16.03.2023.
//

import UIKit

enum LikeButton {
    case pressed
    case unpressed
    
    var image: UIImage {
        switch self {
        case .pressed: return UIImage(named: "like")!
        case .unpressed: return UIImage(named: "likePressed")!
        }
    }
}

