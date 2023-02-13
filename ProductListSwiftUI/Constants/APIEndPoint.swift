//
//  APIEndPoint.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import Foundation

public enum APIEndPoint {
    case productList

    private var baseUrl: String {
        "https://run.mocky.io/v3"
    }

    public var urlPath: String {
        switch self
        {
            case.productList:
            return "\(baseUrl)/2f06b453-8375-43cf-861a-06e95a951328"
        }
    }
}
