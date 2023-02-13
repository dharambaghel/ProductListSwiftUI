//
//  ProductListRow.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct ProductListRow: View {
    @EnvironmentObject private var favorites: Favorites
    let product: Product

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            ProductImageView(imageURL: product.imageURL, imageSize: CGSize(width: 50, height: 50), radius: 8)
            VStack(alignment: .leading) {
                Text(product.name ?? "")
                    .font(.title3)
                    .foregroundColor(.blue)
                Text("Price: $\(String(format: "%.2f", product.price?.first?.value ?? 0.0))")
                    .font(.headline)
                    .foregroundColor(.black)

                HStack{
                    Button(action: {
                        // add to an array
                        print("CTA Clicked")
                    }) {
                        Text("Add To Cart")
                            .foregroundColor(Color.white)
                    }.buttonStyle(PlainButtonStyle())
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                    Spacer()

                    let isFavorite = favorites.products.contains(where: {$0.id == product.id})
                    FavoriteButton(isFavorite: isFavorite, action: {
                        if(isFavorite) {
                            favorites.products.removeAll(where:  {$0.id == product.id})
                        } else {
                            favorites.products.append(product)
                        }
                    })
                }
            }
        }.padding()
    }
}

struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductListRow(product: Products.getProducts().first!)
    }
}

