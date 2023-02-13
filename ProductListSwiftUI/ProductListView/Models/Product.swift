//
//  Product.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

// MARK: - Products
struct Products: Codable {
    let products: [Product]?
    init(products: [Product]? = []) {
        self.products = products
    }
    static func getProducts() -> [Product] {
        return [Product(name: "test", id: "1", imageURL: "https://images.stopgame.ru/games/logos/15459/c413x234/mP_oHEax1hVxI__QmBKeOQ/detroit_become_human.jpg",
                        price: [Price(value: 200.0)],
                        ratingCount: 2.4)]
    }
}

// MARK: - Product
struct Product: Codable {
    let name, id: String?
    let imageURL: String?
    let price: [Price]?
    let ratingCount: Double?
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case id, imageURL, price, ratingCount
    }
}
// MARK: - Price
struct Price: Codable {
    let value: Double?
}

