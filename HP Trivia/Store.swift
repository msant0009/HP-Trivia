//
//  Store.swift
//  HP Trivia
//
//  Created by Mark Santoro on 11/7/24.
//

import Foundation
import StoreKit

enum BookStatus {
    case active
    case inactive
    case locked
}

@MainActor // force to run on main thread
class Store: ObservableObject {
    @Published var books: [BookStatus] = [.active,.active,.inactive,.locked,.locked,.locked,.locked]
    @Published var products: [Product] = []
    private var productIDs = ["hp4","hp5","hp6","hp7"]
    
    func loadProducts() async {
        do {
            products = try await Product.products(for: productIDs)
        } catch {
            print("Couldn't fetch those products \(error)")
        }
    }
}


    

