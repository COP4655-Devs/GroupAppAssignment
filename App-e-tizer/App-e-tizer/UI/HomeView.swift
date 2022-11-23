//
//  HomeView.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            NavigationView {
                if viewModel.authorisationStatus == .denied {
                    LocationAccessErrorView()
                } else {
                    TabView(selection: $viewModel.displayMode,
                            content:  {
                                ListView(viewModel: viewModel)
                                    .tag(DisplayMode.list)

                                MapViewWrapper(viewModel: viewModel)
                                    .tag(DisplayMode.map)
                            })
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }.onReceive(viewModel.$authorisationStatus, perform: { status in
            switch status {
            case .notDetermined:
                viewModel.requestAuthorisation()
            case .authorizedWhenInUse:
                print("Authorization Granted")
            default:
                break
            }
        })
    }
}
