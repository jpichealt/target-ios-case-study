//
//  API.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
import Alamofire

class API {

    static let baseURL: URL = URL(string: "https://api.target.com/mobile_case_study_deals/v1")!

    // get all products
    static func getProducts(completed: @escaping (Result<[Product], Error>) -> ()) {
        let dealsRoute = API.baseURL.appendingPathComponent("deals")
        AF.request(dealsRoute)
            .validate()
            .responseDecodable(of: ProductResponse.self) { response in
                switch response.result {
                case .success(let productResponse):
                    debugPrint("fetched \(productResponse.products.count) products")
                    completed(.success(productResponse.products))
                case .failure(let error):
                    debugPrint("error fetching products: \(error)")
                    completed(.failure(error))
                }
            }
    }

    // get data for a specific product
    static func getProduct(of id: Int,
                           completed: @escaping (Result<Product, Error>) -> ()) {
        let dealsRoute = API.baseURL.appendingPathComponent("deals/")
        AF.request(dealsRoute)
            .validate()
            .responseDecodable(of: Product.self) { response in
                switch response.result {
                case .success(let product):
                    debugPrint("fetched product of id \(product.id)")
                    completed(.success(product))
                case .failure(let error):
                    debugPrint("error fetching product: \(error)")
                    completed(.failure(error))
                }
            }
    }
}
