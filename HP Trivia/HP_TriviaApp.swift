//
//  HP_TriviaApp.swift
//  HP Trivia
//
//  Created by Mark Santoro on 10/30/24.
//

import SwiftUI

@main
struct HP_TriviaApp: App {
    @StateObject private var store = Store()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
