//
//  ProductListRepository.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import Foundation

protocol ProductsRepositoryProtocol {
    func fetchProducts(completion: @escaping(Result<Products, NetworkError>)-> Void)
}

struct ProductsRepository {
    private let restClient: RestAPIClientProtocol?

    init(restClient: RestAPIClientProtocol? = RestAPIClient()) {
        self.restClient = restClient
    }
}

extension ProductsRepository: ProductsRepositoryProtocol {

    private var url: String { return APIEndPoint.productList.urlPath }

    func fetchProducts(completion: @escaping (Result<Products, NetworkError>) -> Void) {
        restClient?.request(type: Products.self, urlString: url, method: .GET,
                            params: [:], completion: completion)
    }
}

