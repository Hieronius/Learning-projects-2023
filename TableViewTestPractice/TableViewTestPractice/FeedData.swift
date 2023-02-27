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
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
}

// MARK: - Source
struct Source: Codable {
    let id: JSONNull?
    let name: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

