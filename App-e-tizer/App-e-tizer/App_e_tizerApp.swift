//
//  App_e_tizerApp.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import SwiftUI

@main
struct App_e_tizerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
