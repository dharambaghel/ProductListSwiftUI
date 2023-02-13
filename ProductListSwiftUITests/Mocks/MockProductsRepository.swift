//
//  MockProductsRepository.swift
//  ProductListSwiftUITests
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import Foundation
@testable import ProductListSwiftUI

final class MockProductsRepository: ProductsRepositoryProtocol {
    var jsonRepose = ""

    func fetchProducts(completion: @escaping (Result<ProductListSwiftUI.Products, ProductListSwiftUI.NetworkError>) -> Void) {

        do {
            let products = try  JSONDecoder().decode(Products.self, from: jsonRepose.data(using: .utf8)!)
            completion(.success(products))
        } catch {
            completion(.failure(.invalidResponse))
        }
    }
}

