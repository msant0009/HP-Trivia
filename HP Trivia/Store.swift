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
    @Published var purchasedIDs = Set<String>()
    
    private var productIDs = ["hp4","hp5","hp6","hp7"]
    private var updates: Task<Void, Never>? = nil
    
    init() {
        updates = watchForUpdates()
    }
    
    func loadProducts() async {
        do {
            products = try await Product.products(for: productIDs)
        } catch {
            print("Couldn't fetch those products \(error)")
        }
    }
    
    func purchase(_ product: Product) async {
        do {
            let result = try await product.purchase()
            
            switch result {
            case .success(let verificationResult):
                // purchase successful, but need receipt verification
                switch verificationResult {
                case .unverified(let signedType, let verificationError):
                    print("Error on \(signedType): \(verificationError)")
                    
                case .verified(let signedType):
                    purchasedIDs.insert(signedType.productID)
                }
                
            case .userCancelled:
                break
                //User cancelled or purchase dissaproved
            case .pending:
                break
                // waiting for approval
            @unknown default:
                break
            }
            
            
        }catch {
            print("Couldn't purchase product \(error)")
        }
        
        
        
    }
    
    private func checkPurchases() async {
        for product in products {
            guard let state = await product.currentEntitlement else {return}
            
            switch state {
            case .unverified(let signedType, let verificationError):
                print("Error on \(signedType): \(verificationError)")
            case .verified(let signedType):
                if signedType.revocationDate == nil {
                    purchasedIDs.insert(signedType.productID)
                } else {
                    purchasedIDs.remove(signedType.productID)
                }
                
                
            }
            
            
        }
    }
    
    // in case the user bought outside of the app (AppStore)
    private func watchForUpdates() -> Task<Void, Never> {
        Task(priority: .background) {
            for await _ in Transaction.updates {
                await checkPurchases()
            }
        }
        
        
    }
}


    

