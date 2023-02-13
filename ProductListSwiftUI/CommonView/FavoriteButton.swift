//
//  FavoriteButton.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void
    var body: some View {

        Button(action: action){
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? Color.red : Color.gray)
        }.buttonStyle(.plain)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavorite: false, action: {})
    }
}
