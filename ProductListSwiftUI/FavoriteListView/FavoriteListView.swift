//
//  FavoriteListView.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct FavoriteListView: View {
    @EnvironmentObject private var favorites: Favorites

    var body: some View {
        HStack(alignment:.top, spacing: 20.0) {
            NavigationView {
                List {
                    ForEach(favorites.products , id: \.id) {
                        product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductListRow(product: product)
                        }
                    }
                }.navigationTitle("Favorite")
            }
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
    }
}
