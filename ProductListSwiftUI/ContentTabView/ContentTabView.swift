//
//  ContentTabView.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct ContentTabView: View {

    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Text("Products")
                    Image(systemName: "house.fill")
                }
            FavoriteListView()
                .tabItem {
                    Text("Favorite")
                    Image(systemName: "heart.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}

