//
//  Product.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation

struct Product: Codable, Equatable {
    let aisle: String
    let description: String
    let id: Int
    let imageUrlString: String?
    let regularPrice: Price
    let salePrice: Price?
    let title: String

    var imageUrl: URL? {
        imageUrlString.flatMap {
            URL(string: $0)
        }
    }

    enum CodingKeys: String, CodingKey {
        case aisle
        case description
        case id
        case imageUrlString = "image_url"
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
        case title
    }
}

func ==(lhs: Product, rhs: Product) -> Bool {
    return lhs.id == rhs.id
}
