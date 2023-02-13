//
//  ProductListSwiftUIApp.swift
//  ProductListSwiftUI
//
//  Created by Dharmendra Baghel on 10/02/23.
//

import SwiftUI

@main
struct ProductListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentTabView().environmentObject(Favorites())
        }
    }
}
