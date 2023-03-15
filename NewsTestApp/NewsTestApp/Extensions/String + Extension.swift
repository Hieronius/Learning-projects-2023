//
//  String + extension.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 15.03.2023.
//

import Foundation

extension String {
    func formateArticleDate() -> String {
        let maxLenght = 10
        let result = String(self.prefix(maxLenght))
        print(result)
        return result
        
    }
}
 
