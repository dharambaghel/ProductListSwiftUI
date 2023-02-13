//
//  ProductListViewModel.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

// Favorite items
class Favorites: ObservableObject {
    @Published var products:[Product] = []
}

protocol ProductsListViewProtocol {

    var products: [Product] {get}
    func fetchProducts(completion: (() -> Void)?)
    var loading: Bool {get}
}

class ProductListViewModel: ProductsListViewProtocol, ObservableObject {

    @Published var products: [Product] = []
    @Published var loading = true
    @Published var errorMessage: String?


    private let productsRepository: ProductsRepositoryProtocol

    init(productsRepository: ProductsRepositoryProtocol = ProductsRepository()) {
        self.productsRepository = productsRepository
    }

    internal func fetchProducts(completion: (() -> Void)?) {
        productsRepository.fetchProducts{ [weak self] result in

            DispatchQueue.main.async {
                self?.loading=false
                switch result {
                    case.success(let data):
                        self?.errorMessage = nil
                        self?.products = data.products ?? []
                    case.failure(let error):
                        self?.errorMessage = ("error \(error.localizedDescription)")
                }
                completion?()
            }
        }
    }
}

