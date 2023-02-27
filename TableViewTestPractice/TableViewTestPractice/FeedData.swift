//
//  FeedData.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 27.02.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feedData = try? JSONDecoder().decode(FeedData.self, from: jsonData)

import Foundation

// MARK: - FeedData
struct FeedData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
     let source: Source
     let author: String?
     let title: String
     let description: String?
     let url: String
     let urlToImage: String?
     // JSON has Date data type of the publishedAt property
     // May be need some fixes
     let publishedAt: String
     let content: String
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
















