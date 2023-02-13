//
//  RestAPIClient.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import Foundation

public enum HttpMethod: String {
    case GET = "GET"
    case POST = "POST"
}

enum NetworkError: Error {
    case invalidResponse
    case invalidUrl
    case requestFailed
}

protocol RestAPIClientProtocol {
    func request<T:Codable>(type: T.Type, urlString: String, method: HttpMethod, params: [String: Any],
                            completion: @escaping(Result<T, NetworkError>) ->Void)
}

final class RestAPIClient: RestAPIClientProtocol {
    func request<T:Codable>(type: T.Type, urlString: String,
                            method: HttpMethod = .GET,
                            params:  [String: Any] = [:],
                            completion: @escaping(Result<T, NetworkError>) ->Void ) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(.invalidUrl))
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if(method == .POST) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else {
                return completion(.failure(.requestFailed))
            }

            guard let responseData = try? JSONDecoder().decode(type.self, from: data) else {
                return completion(.failure(.invalidResponse))
            }
            completion(.success(responseData))

        }.resume()
    }
}

