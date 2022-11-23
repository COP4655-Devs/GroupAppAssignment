//
//  MapViewWrapper.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import SwiftUI

struct MapViewWrapper: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            MapView(region: $viewModel.region,
                    pois: $viewModel.pointsOfInterest,
                    selectedPOI: $viewModel.selectedPointOfInterest) { region in
                print("Region did change by user \(region)")
            }
        }
        .navigationBarItems(leading: Button("Filters", action: {
            viewModel.showFilters = true
        }), trailing: Button("List", action: {
            viewModel.displayMode = .list
        }))
        .navigationTitle("Map")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MapViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        MapViewWrapper(viewModel: HomeViewModel())
    }
}
