//
//  ProductImageView.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct ProductImageView: View {

    @State private var image: Image?
    let imageURL: String?
    let imageSize: CGSize
    var radius: CGFloat = 8
    let cache = URLCache.shared

    var body: some View {
        VStack {
            if image != nil {
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(radius)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(radius)
            }
        }.onAppear {
            if let imageStringURL = imageURL, let url = URL(string: imageStringURL){
                loadImage(url: url)
            }
        }
    }
}
extension ProductImageView {
    private func loadImage(url: URL) {
        let request = URLRequest(url: url)
        if (self.cache.cachedResponse(for: request) != nil) {
            loadImageFromCache(request: request)
        } else {
            downloadImage(request: request)
        }
    }

    private func loadImageFromCache(request: URLRequest) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = self.cache.cachedResponse(for: request)?.data {
                createImageFromData(data: data)
            }
        }
    }

    private func downloadImage(request: URLRequest) {
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, _ in
                if let data = data, let response = response {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    self.cache.storeCachedResponse(cachedData, for: request)
                    createImageFromData(data: data)
                }
            }
            dataTask.resume()
        }
    }

    private func createImageFromData(data: Data) {
        if let uiImage = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }

}

struct ProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView(imageURL: "", imageSize: CGSize(width: 50, height: 50), radius: 10)
    }
}
