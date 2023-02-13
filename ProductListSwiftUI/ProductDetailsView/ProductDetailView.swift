//
//  ProductDetailView.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject private var favorites: Favorites
    let product: Product

    var body: some View {

        VStack( alignment:.center){
            GeometryReader  { geometry in
                ProductImageView(imageURL: product.imageURL, imageSize: CGSize( width: geometry.size.width, height: geometry.size.height))

                let isFavorite = favorites.products.contains(where: {$0.id == product.id})
                FavoriteButton(isFavorite: isFavorite) {
                    if(isFavorite) {
                        favorites.products.removeAll(where:  {$0.id == product.id})
                    }else{
                        favorites.products.append(product)
                    }
                }.position(x: geometry.size.width - 20, y: geometry.size.height)

            }.padding(20)

            VStack(alignment:.center, spacing: 16) {
                Text(product.name ?? "")
                    .font(.title3)
                    .foregroundColor(.blue)
                Text("Price: $\(String(format: "%.2f", product.price?.first?.value ?? 0.0))")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Rating: \(String(format: "%.1f",product.ratingCount ?? 0.0))")
                    .font(.body)
                    .foregroundColor(.black)
                Spacer()
            }
            Spacer()
        }
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Products.getProducts().first!)
    }
}

