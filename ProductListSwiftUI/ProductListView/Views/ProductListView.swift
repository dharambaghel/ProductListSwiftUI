//
//  ProductListView.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var productListViewModel: ProductListViewModel = ProductListViewModel()

    var body: some View {

        ActivityIndicatorView(isShowing: .constant(productListViewModel.loading)) {
            HStack(alignment:.top, spacing: 20.0) {
                if let error = productListViewModel.errorMessage {
                    Text(error)
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    NavigationView {
                        List {
                            ForEach(productListViewModel.products , id: \.id) {
                                product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductListRow(product: product)
                                }
                            }
                        }.navigationTitle("Product List")
                    }
                }
            }.onAppear() {
                productListViewModel.fetchProducts(completion: {})
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

